<div class="page-header {if $node.data_map.cacher_titre.data_int|eq(1)}hide{/if}">
    <h1>
        {"404 - Page not found"|i18n('damien')}
        <small>{'Walker is on the case'|i18n('damien')}</small>
    </h1>
</div>

<div class="row" id="error">

    <div class="span3 offset4 alert">
    <p>{"The requested module %module could not be found."|i18n("design/standard/error/kernel",,
                                                                hash('%module',concat("<span class='label label-important'>", $parameters.module|wash, "</span>")))}</p>
    <p>{"Possible reasons for this are"|i18n("design/standard/error/kernel")}:</p>
    <ul>
        <li>{"The module name was misspelled, try changing the URL."|i18n("design/standard/error/kernel")}</li>
        <li>{"The module does not exist on this site."|i18n("design/standard/error/kernel")}</li>
        <li>{"This site uses siteaccess matching in the URL and you did not supply one, try inserting a siteaccess name before the module in the URL ."|i18n("design/standard/error/kernel")}</li>
    </ul>
    </div>

</div>
