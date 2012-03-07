{if gt($node.data_map.tags.content.keywords|count, 0)}
<h2>{'Tags'|i18n('damien')}</h2>

<div id="tags">

    {foreach $node.data_map.tags.content.keywords as $k)}
    <a href="">{$k}</a>
    {/foreach}

</div>
{/if}
