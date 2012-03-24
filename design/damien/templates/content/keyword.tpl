{def $page_limit = 20
     $list_count = fetch( 'content', 'keyword_count', hash( 'alphabet', $alphabet,
                                                           'limit', $page_limit,
                                                           'offset', $view_parameters.offset,
                                                           'classid', $view_parameters.classid ) )
     $uniq_id = 0
     $uniq_post = array()}

<div class="page-header {if $node.data_map.cacher_titre.data_int|eq(1)}hide{/if}">
    <h1>
        {"Keywords"|i18n('damien'))}
        <small>{$alphabet}</small>
    </h1>
</div>

<ul>
{if $list_count}
    {foreach fetch( 'content', 'keyword', hash( 'alphabet', $alphabet,
                                                'limit', $page_limit,
                                                'offset', $view_parameters.offset,
                                                'classid', $view_parameters.classid ) ) as $keyword
            sequence array( 'bgdark', 'bglight' ) as $style}
    {set $uniq_id = $keyword.link_object.node_id}
    {if $uniq_post|contains( $uniq_id )|not}
        <li>
            <a href={$keyword.link_object.object.main_node.url_alias|ezurl}>{$keyword.link_object.name|wash}</a><br/>
            <span class="lien">{$keyword.link_object.object.main_node.url_alias|ezurl(no,full)}</span>
        </li>
    {set $uniq_post = $uniq_post|append( $uniq_id )}
    {/if}
    {/foreach}
{/if}
</ul>

{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri=concat('/content/keyword/', $alphabet)
         item_count=$list_count
         view_parameters=$view_parameters
         item_limit=$page_limit}
