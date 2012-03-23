{default attribute_base=ContentObjectAttribute}
{let data_text=cond( is_set( $#collection_attributes[$attribute.id] ), $#collection_attributes[$attribute.id].data_text, $attribute.content )}
<input class="span4" type="text" name="{$attribute_base}_data_text_{$attribute.id}" value="{$data_text|wash( xhtml )}" />
{/let}
{/default}
