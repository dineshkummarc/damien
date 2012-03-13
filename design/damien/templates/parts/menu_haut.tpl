{def $menu_haut = fetch(content, node, hash(node_id, 69))}
<ul>
    {foreach $menu_haut.data_map.elements.content.relation_list as $e}
    <li>
        {def $n = fetch(content, node, hash(node_id, $e.node_id))}
        <a href={$n.url_alias|ezurl} {if eq( ne($e.node_id, 2), $node.path_array|contains($e.node_id))}class="inside"{/if}>
            {$n.name}
        </a>
        {undef $n}
    </li>
    {/foreach}
</ul>
{undef $menu_haut}
<div class="clear"></div>
