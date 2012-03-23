{set-block scope=global variable=cache_ttl}0{/set-block}

{let search=false()}
{section show=$use_template_search}
    {set page_limit=10}
    {set search=fetch(content,search,
                      hash(text,$search_text,
                           section_id,$search_section_id,
                           subtree_array,$search_subtree_array,
                           sort_by,array('modified',false()),
                           offset,$view_parameters.offset,
                           limit,$page_limit))}
    {set search_result=$search['SearchResult']}
    {set search_count=$search['SearchCount']}
    {set stop_word_array=$search['StopWordArray']}
    {set search_data=$search}
{/section}

<div class="page-header">
    <h1>
        {"Search"|i18n("damien")}
    </h1>
</div>

<form action={"/content/search/"|ezurl} method="get" class="form-search">

    <input class="input-medium search-query" type="text" size="20" name="SearchText" id="Search" value="{$search_text|wash}" />
    <input class="btn" name="SearchButton" type="submit" value="{'Search'|i18n('damien')}" />

</form>

{section show=$stop_word_array}
    <p>
    {"The following words were excluded from the search:"|i18n("design/ezwebin/content/search")}:
    {section name=StopWord loop=$stop_word_array}
        {$StopWord:item.word|wash}
        {delimiter}, {/delimiter}
    {/section}
    </p>
{/section}

{switch name=Sw match=$search_count}
  {case match=0}
  <div class="warning">
  <h2>{'No results were found when searching for "%1".'|i18n("design/ezwebin/content/search",,array($search_text|wash))}</h2>
  </div>
    <p>{'Search tips'|i18n('design/ezwebin/content/search')}</p>
    <ul>
        <li>{'Check spelling of keywords.'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Try changing some keywords (eg, "car" instead of "cars").'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Try searching with less specific keywords.'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Reduce number of keywords to get more results.'|i18n('design/ezwebin/content/search')}</li>
    </ul>
  {/case}
  {case}
  <div class="feedback">
  <h2>{'Search for "%1" returned %2 matches'|i18n("design/ezwebin/content/search",,array($search_text|wash,$search_count))}</h2>
  </div>
  {/case}
{/switch}

<p>
    <ul>
    {section name=SearchResult loop=$search_result show=$search_result sequence=array(bglight,bgdark)}
       <li>{node_view_gui view=line sequence=$:sequence use_url_translation=$use_url_translation content_node=$:item}</li>
    {/section}
    </ul>
</p>

{include name=Navigator
         uri='design:navigator/google.tpl'
         page_uri='/content/search'
         page_uri_suffix=concat('?SearchText=',$search_text|urlencode,$search_timestamp|gt(0)|choose('',concat('&SearchTimestamp=',$search_timestamp)))
         item_count=$search_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

{/let}
