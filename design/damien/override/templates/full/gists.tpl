{set-block scope=global variable=cache_ttl}0{/set-block}

<div class="page-header {if $node.data_map.cacher_titre.data_int|eq(1)}hide{/if}">
    <h1>
        {$node.name}
        {if $node.data_map.sous_titre.has_content}<small>{$node.data_map.sous_titre.data_text|wash}</small>{/if}
    </h1>
</div>

{def $gists = fetch(gist, list)}

<div class="colonnes">
    <ul class="gists unstyled">
    {foreach $gists as $gist}
        <li>
            <a data-toggle="modal" href="#modal_gist_{$gist.id}">{$gist.description}</a>
            <div class="modal hide fade" id="modal_gist_{$gist.id}">
                {def $gist = fetch(gist, content, hash(gist_id, $gist.id))}
                <div class="modal-header">
                    <a class="close" data-dismiss="modal">×</a>
                    <h3>{$gist.description}</h3>
                </div>
                <div class="modal-body">

                    <div class="tabbable">
                        {if $gist.files|count|gt(1)}
                        <ul class="nav nav-tabs">
                            {def $cpt = 0}
                            {foreach $gist.files as $file}
                                <li{if eq($cpt, 1)} class="active"{/if}>
                                    <a href="{$gist.id}_{$cpt}" data-toggle="tab">
                                        {$file.filename}
                                    </a>
                                </li>
                                {set $cpt = inc($cpt)}
                            {/foreach}
                            {undef $cpt}
                        </ul>
                        {/if}
                        <div class="tab-content">
                        {def $cpt = 0}
                        {foreach $gist.files as $file}
                            <div cl ass="tab-pane {if eq($cpt, 1)}active{/if}" id="{$gist.id}_{$cpt}">
                                {ezsh($file.content, $file.language|downcase)}
                            </div>
                            {set $cpt = inc($cpt)}
                        {/foreach}
                        {undef $cpt}
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <a href="{$gist.html_url}" target="_blank" class="btn btn-primary">{'Display on Github'|ez18n('damien')}</a>
                </div>
            </div>
            {undef $gist}
        </li>
    {/foreach}
    </ul>
</div>

{undef $gists}

<hr />

<span class="label label-info">{'Informations:'|i18n('damien')}</span> {'Those data are displayed in live from Github.'|i18n('damien')}
