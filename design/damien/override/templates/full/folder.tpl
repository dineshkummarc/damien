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

<ul>
{foreach $subitems as $item}
    <li>
        <a href={$item.url_alias|ezurl}>
            {$item.name}
        </a>
    </li>
{/foreach}
</ul>

{undef $subitems}
{undef $classes}
