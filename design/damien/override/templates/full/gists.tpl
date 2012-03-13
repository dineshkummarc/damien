{set-block scope=global variable=cache_ttl}0{/set-block}

<h1>{$node.name}</h1>

{def $gists = fetch(gist, list)}

<ul class="gists">
{foreach $gists as $gist}
    <li>
        <a href={concat('gist/show/',$gist.id)|ezurl}>{$gist.description}</a>
    </li>
{/foreach}
</ul>

{undef $gists}

{'Those data are displayed in live from Github.'|i18n('damien')}
