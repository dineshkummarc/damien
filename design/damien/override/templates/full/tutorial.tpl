{set-block scope=global variable=cache_ttl}0{/set-block}

<h1>{$node.name}</h1>

{attribute_view_gui attribute=$node.data_map.intro}

{def $pages = fetch(content, list, hash(parent_node_id, $node.node_id, sort_by, $node.sort_array, class_filter_type, include, class_filter_array, array('tutorial_page')))}

<ul>
{foreach $pages as $p}
    <li>
        <a href={$p.url_alias|ezurl}>
            {$p.name}
        </a>
    </li>
{/foreach}
</ul>

{undef $pages}
