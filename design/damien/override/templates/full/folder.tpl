{set-block scope=global variable=cache_ttl}0{/set-block}

<div class="page-header {if $node.data_map.cacher_titre.data_int|eq(1)}hide{/if}">
    <h1>
        {$node.name}
        {if $node.data_map.sous_titre.has_content}<small>{$node.data_map.sous_titre.data_text|wash}</small>{/if}
    </h1>
</div>

{attribute_view_gui attribute=$node.data_map.description}

{def $classes = array('article', 'folder', 'tutorial')}
{def $subitems = fetch(content, list, hash(parent_node_id, $node.node_id, sort_by, $node.sort_array, class_filter_type, include, class_filter_array, $classes))}

<ul class="thumbnails">
{foreach $subitems as $item}
    <li class="span4">
        <div class="thumbnail">
            <img alt="" src={$item.data_map.visuel.content['thumbnail'].url|ezroot} />
            <div class="caption">
                <div class="inside">
                    <h5>{$item.name}</h5>
                    <p>
                    {switch match=$item.class_identifier}
                        {case match='article'}
                            {$item.data_map.body.data_text|strip_tags|shorten(500)}
                            {/case}
                        {case match='tutorial'}
                            {$item.data_map.intro.data_text|strip_tags|shorten(500)}
                            {/case}
                    {/switch}
                    </p>
                </div>
                <p>
                    <a class="btn btn-primary" href={$item.url_alias|ezurl}>
                        {'See'|i18n('damien')}
                    </a>
                </p>
            </div>
        </div>
    </li>
{/foreach}
</ul>

{undef $subitems}
{undef $classes}
