{set-block scope=root variable=subject}{"Collected information from %1"|i18n("design/ezwebin/collectedinfomail/form",,array($collection.object.name|wash))}{/set-block}

{if and(is_set($object.data_map.recipient), $object.data_map.recipient.has_content)}
{set-block scope=root variable=email_receiver}{$object.data_map.recipient.content}{/set-block}
{/if}

<div class="page-header {if $node.data_map.cacher_titre.data_int|eq(1)}hide{/if}">
    <h1>
        {"Thanks"|i18n("damien")}
    </h1>
</div>

<p>
    {"Your message has been sent."|i18n("damien")}
</p>
