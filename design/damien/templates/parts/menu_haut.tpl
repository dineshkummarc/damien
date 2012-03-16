{def $menu_haut = fetch(content, node, hash(node_id, 69))}
<div class="navbar">
    <div class="navbar-inner">
        <div class="container">

            <ul class="nav">
                {foreach $menu_haut.data_map.elements.content.relation_list as $e}
                {def $n = fetch(content, node, hash(node_id, $e.node_id))}
                <li {if and( ne($e.node_id, 2), $node.path_array|contains($e.node_id))}class="active"{/if}>
                    <a href={$n.url_alias|ezurl}>
                        {$n.name}
                    </a>
                    {undef $n}
                </li>
                {/foreach}
            </ul>

            <form action={"/content/search"|ezurl} class="navbar-search pull-right">
                <input name="SearchText" type="text" class="search-query" placeholder="{'Search'|i18n('damien')}" />
            </form>

        </div>
    </div>
</div>

{undef $menu_haut}
<div class="clear"></div>
