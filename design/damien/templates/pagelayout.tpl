{set-block scope=global variable=cache_ttl}0{/set-block}
{def $node = fetch(content, node, hash(node_id, $module_result.node_id))}
<!DOCTYPE HTML>
<html lang="fr">

    <head>

        <meta charset="UTF-8">

        {def $meta = metadata($module_result.node_id)}
        {if $meta}
            {if $meta.title}
                <title>{$meta.title|wash}</title>
            {/if}
            {if $meta.keywords}
	            <meta name="keywords" content="{$meta.keywords|implode(',')|wash}" />
            {/if}
            {if $meta.description}
                <meta name="description" content="{$meta.description|wash}" />
            {/if}
        {else} 
            <title>{$node.name} - MARTIN-Damien.fr</title>
            {foreach $site.meta as $key => $item }
                <meta name="{$key|wash}" content="{$item|wash}" />
            {/foreach}
        {/if}
        {undef $meta}

        <link rel="shortcut icon" href={"favicon.ico"|ezroot} type="image/x-icon">
        <link rel="icon" href={"favicon.ico"|ezroot} type="image/x-icon">

        <link rel="stylesheet" href={"stylesheets/bootstrap.min.css"|ezdesign} />
        <link rel="stylesheet" href={"stylesheets/jquery.qtip.min.css"|ezdesign} />
        {array("damien.less")|ezless_add()}
        {ezless()}
        <script type="text/javascript" src={"javascript/prefixfree.min.js"|ezdesign}></script>

        <script type="text/javascript" src={"javascript/jquery.min.js"|ezdesign}></script>
        <script type="text/javascript" src={"javascript/jquery.qtip.min.js"|ezdesign}></script>
        <script type="text/javascript" src={"javascript/bootstrap.min.js"|ezdesign}></script>

        <script type="text/javascript" src={"javascript/jquery.dotdotdot.min.js"|ezdesign}></script>

        <script type="text/javascript" src={"javascript/action.js"|ezdesign}></script>

    </head>

    <body>

        <div id="main" class="container">

            <header>
                <div id="header">
                    Martin Damien
                    <span>
                        {'multimedia developer'|i18n('damien')}
                    </span>
                </div>
            </header>

            <nav>
                <div id="menu">
                    {include uri='design:parts/menu_haut.tpl'}
                </div>
            </nav>

            <div class="row">
            <article>
                <div class="span8 last" id="article">

                    <nav>
                        <div id="ariane">
                            {include uri='design:parts/breadcrumb.tpl' path=$node.path_array}
                        </div>
                    </nav>

                    {$module_result.content}

                </div>
            </article>

            <aside>
                <div class="span3 last" id="side">

                    <img src={"angle-haut-side.png"|ezimage} alt="" />

                    <div id="innerside">

                        <h2>{'Languages'|i18n('damien')}</h2>

                        <div id="langues">

                            {include uri='design:parts/languages.tpl'}

                        </div>

                        {include uri='design:parts/tags.tpl' node=$node}

                        <h2>{'Share'|i18n('damien')}</h2>


                        <div id="partager">
                            <!-- AddThis Button BEGIN -->
                            <a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pubid=ra-4f568fe55cc38dcd"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a>
                            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4f568fe55cc38dcd"></script>
                            <!-- AddThis Button END -->
                        </div>

                        <div id="lienssociaux">

                            <a href={"content/view/full/81"|ezurl}>
                                <img src={"mail.png"|ezimage} alt="{'Contact me by e-mail.'|i18n('damien')}" />
                            </a>

                            <a href="http://www.twitter.com/#/lepereporcher" target="_blank">
                                <img src={"twitter.png"|ezimage} alt="{'Follow me on Twitter.'|i18n('damien')}" />
                            </a>

                            <a href={"rss/feed/global"|ezurl}>
                                <img src={"rss.png"|ezimage} alt="{'Get the RSS feed.'|i18n('damien')}" />
                            </a>

                        </div>

                    </div>

                </div>
            </aside>
            </div>

            <footer>
                <div id="footer">

                    <div class="row">

                        <div class="span4">

                            <h3>Links</h3>

                        </div>

                        <div class="span8">

                            <h3>About the author</h3>

                        </div>

                    </div>

                </div>
            </footer>

        </div>

    </body>

</html>
{undef $node}
