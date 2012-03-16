{if gt($path|count, 3)}
    {set $path = $path|extract_right($path|count|dec|dec)}
    <ul class="breadcrumb">
    {foreach $path as $p}
        {def $node = fetch(content, node, hash(node_id, $p))}
        {if ne($p, $path[$path|count|dec])}
            <li>
                <a href={$node.url_alias|ezurl}>{$node.name|wash|shorten(40, '...', 'middle')}</a> <span class="divider">/</span>
            </li>
        {else}
            <li class="active">{$node.name|wash|shorten(40, '...', 'middle')}</li>
        {/if}
    {/foreach}
    </ul>
{/if}
