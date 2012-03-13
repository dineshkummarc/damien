{def 
    $fr = false()
    $en = false()
    $jp = false()
    $eo = false()
}

    {foreach $node.object.current.translation_list as $language}
        {switch match=$language.language_code}
            {case match='fre-FR'}
                {set $fr = true()}
                {/case}
            {case match='eng-GB'}
                {set $en = true()}
                {/case}
            {case match='jpn-JP'}
                {set $jp = true()}
                {/case}
            {case match='epo-EO'}
                {set $eo = true()}
                {/case}
        {/switch}
    {/foreach}

    {if $fr}
        <a href={concat('switchlanguage/to/fre/', $requested_uri_string)|ezurl}>
            <img src={"flags/fr-on.png"|ezimage} alt="Afficher la page en français." />
        </a>
    {else}
        <img src={"flags/fr-off.png"|ezimage} alt="Afficher la page en français." />
    {/if}

    {if $en}
        <a href={concat('switchlanguage/to/eng/', $requested_uri_string)|ezurl}>
            <img src={"flags/uk-on.png"|ezimage} alt="View this page in english." />
        </a>
    {else}
        <img src={"flags/uk-off.png"|ezimage} alt="View this page in english." />
    {/if}

    {if $jp}
        <a href={concat('switchlanguage/to/jpn/', $requested_uri_string)|ezurl}>
            <img src={"flags/jp-on.png"|ezimage} alt="日本語でこのページを表示する。" />
        </a>
    {else}
        <img src={"flags/jp-off.png"|ezimage} alt="日本語でこのページを表示する。" />
    {/if}

    {if $eo}
        <a href={concat('switchlanguage/to/epo/', $requested_uri_string)|ezurl}>
            <img src={"flags/eo-on.png"|ezimage} alt="Montri ĉi paĝo en esperanto." />
        </a>
    {else}
        <img src={"flags/eo-off.png"|ezimage} alt="Montri ĉi paĝo en esperanto." />
    {/if}

{undef}
