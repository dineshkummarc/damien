{set-block scope=global variable=cache_ttl}0{/set-block}

<div class="page-header {if $node.data_map.cacher_titre.data_int|eq(1)}hide{/if}">
    <h1>
        {$node.name}
        {if $node.data_map.sous_titre.has_content}<small>{$node.data_map.sous_titre.data_text|wash}</small>{/if}
    </h1>
</div>

{attribute_view_gui attribute=$node.data_map.body}
