{set-block scope=global variable=cache_ttl}0{/set-block}

<div class="page-header {if $node.data_map.cacher_titre.data_int|eq(1)}hide{/if}">
    <h1>
        {$node.name}
        {if $node.data_map.sous_titre.has_content}<small>{$node.data_map.sous_titre.data_text|wash}</small>{/if}
    </h1>
</div>

{include name=Validation uri='design:content/collectedinfo_validation.tpl'
         class='message-warning'
         validation=$validation collection_attributes=$collection_attributes}

<div class="row">

    <div class="span4">

        <form method="post" action={"content/action"|ezurl}>

            <h4>{$node.data_map.sender_name.contentclass_attribute.name}</h4>
            <div class="attribute-sender-name">
                    {attribute_view_gui attribute=$node.data_map.sender_name}
            </div>

            <h4>{$node.data_map.email.contentclass_attribute.name}</h4>
            <div class="attribute-email">
                    {attribute_view_gui attribute=$node.data_map.email}
            </div>

            <h4>{$node.data_map.subject.contentclass_attribute.name}</h4>
            <div class="attribute-subject">
                    {attribute_view_gui attribute=$node.data_map.subject}
            </div>

            <h4>{$node.data_map.message.contentclass_attribute.name}</h4>
            <div class="attribute-message">
                    {attribute_view_gui attribute=$node.data_map.message}
            </div>

            <div class="content-action">
                <input type="submit" class="btn btn-info" name="ActionCollectInformation" value="{"Send"|i18n("damien")}" />
                <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
                <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
                <input type="hidden" name="ViewMode" value="full" />
            </div>

        </form>

    </div>

    <div class="span3 alert">

        {attribute_view_gui attribute=$node.data_map.warning}

    </div>

</div>

