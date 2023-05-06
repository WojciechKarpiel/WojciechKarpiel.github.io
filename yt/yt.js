document.addEventListener("DOMContentLoaded", function(){
    const source = document.getElementById('sznurek');
    const result = document.getElementById('wynik');

    const inputHandler = function(e) {
        var resultHtml = "";
        var f = null;
        if (e != null){
            f = e.target;
        }else{
            f = document.getElementById('sznurek');
        }
        const inputValue = f.value;

        if (inputValue.length === 0) {
            resultHtml = "";
        }else {
            var url = null
            var urlError=null;
            try {
                url = new URL(inputValue);
            }catch(err){
                urlError = err;
            }
            if(urlError != null){
                resultHtml="To na pewno sznurek?";
            } else{
                const vQuery = url.searchParams.get('v')
                if (vQuery != null && vQuery.length > 0) {
                    const url = "https://www.youtube-nocookie.com/embed/" + vQuery
                    resultHtml='<div><a href="'+url+'">'+url+'</a></div><div><iframe width="560" height="315" src="'+url+'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>'
                }else{
                    resultHtml="To na pewno sznurek do filmu na YT?"
                }
            }
            
        }
        result.innerHTML = resultHtml;
    }
    source.addEventListener('input', inputHandler);
    inputHandler(null);
})
