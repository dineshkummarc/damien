{set-block scope=global variable=cache_ttl}0{/set-block}

<h1>{$node.name}</h1>

{def $gists = fetch(gists, list)}

<ul>
{foreach $gists as $gist}
    <li>
        {$gist.description} - {$gist.id}
    </li>
{/foreach}
</ul>

{undef $gists}
