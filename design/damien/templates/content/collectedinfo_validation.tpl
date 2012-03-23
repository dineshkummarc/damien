{section show=and($validation.processed,$collection_attributes)}

    {section show=$validation.attributes}

        <div class="row">
        <div class="alert alert-error span7">
            <a class="close" data-dismiss="alert">&times;</a>
            <ul>
            {section name=UnvalidatedAttributes loop=$validation.attributes show=$validation.attributes}
                <li>{$:item.name|wash}: {$:item.description}</li>
            {/section}
          </ul>
        </div>
        </div>

    {/section}

{/section}
