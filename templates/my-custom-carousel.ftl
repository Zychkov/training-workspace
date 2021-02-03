<style>
    #<@portlet.namespace />carousel {
        position: relative;
    }

    #<@portlet.namespace />carousel .slides {
        width: 100%;
    }

    #<@portlet.namespace />carousel h1 {
        color: white;
        font-size: 50px;
        position: absolute;
        text-align: center;
        top: 100px;
        width: 100%;
    }
</style>

<#if entries?has_content>
    <div id="<@portlet.namespace />carousel" name="<@portlet.namespace />carousel">
        <#assign imageMimeTypes = propsUtil.getArray("dl.file.entry.preview.image.mime.types") />

        <#list entries as entry>
            <#if imageMimeTypes?seq_contains(entry.getMimeType())>
                <img class="slides" src="${dlUtil.getPreviewURL(entry, entry.getFileVersion(), themeDisplay, "")}">
            </#if>
        </#list>
        <h1>My Custom Carousel</h1>
    </div>

    <script>
        var slideIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("slides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > x.length) {slideIndex = 1}
            x[slideIndex-1].style.display = "block";
            setTimeout(carousel, 3000); // Change image every 3 seconds
        }
    </script>
</#if>