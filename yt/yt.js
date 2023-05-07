document.addEventListener("DOMContentLoaded", function(){
    const source = document.getElementById('sznurek');
    const result = document.getElementById('wynik');
    const countInstances = function(string, word) {
        return string.split(word).length - 1;
    }
    const getHtml = function(v){
        const url = "https://www.youtube-nocookie.com/embed/" + v;
        return '<div><a href="'+url+'">'+url+'</a></div><div><iframe width="560" height="315" src="'+url+'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>'
    }
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
                    resultHtml= getHtml(vQuery)
                }else{
                    const p = url.pathname;
                    if (p != null && p.startsWith("/") && p.length>1 && countInstances(p,"/")==1 ){
                        const vq = p.substring(1)
                        resultHtml=getHtml(vq);
                    }else{
                        resultHtml="To na pewno sznurek do filmu na YT?"
                    }
                }
            }
            
        }
        result.innerHTML = resultHtml;
    }
    source.addEventListener('input', inputHandler);
    inputHandler(null);
})
