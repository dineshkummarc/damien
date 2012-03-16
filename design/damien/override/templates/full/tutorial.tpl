{set-block scope=global variable=cache_ttl}0{/set-block}

<div class="page-header">
    <h1>{$node.name}</h1>
</div>

{attribute_view_gui attribute=$node.data_map.intro}

<hr />

<h2>{'Table of contents'|i18n('damien')}</h2>

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
