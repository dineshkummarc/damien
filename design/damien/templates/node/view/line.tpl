{if is_set( $node.url_alias )}
    <a href="{$node.url_alias|ezurl('no')}" title="{$node.name|wash()}">{$node.name|wash()}</a><br/>
    <span class="lien">{$node.url_alias|ezurl(no,full)}</span>
{else}
    {$node.name|wash()}
    <span class="lien">{$node.url_alias|ezurl(no,full)}</span>
{/if}
