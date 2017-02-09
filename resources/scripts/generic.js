document.oncontextmenu=function(e){return false;};
window.onbeforeunload=function(){};
window.onunload=function(){};

(function(){
if(navigator.userAgent.indexOf("MSIE 6")!=-1 || navigator.userAgent.indexOf("MSIE 7")!=-1){
alert("We have detected that you are using a very out-dated version of your browser. \n\nWe recommend you to upgrade your browser to a more recent version, in order to have a rich user experience & improved security.");
}
})();

var DOMTools={
	BrowserIsMSIE:function(){return (navigator.userAgent.indexOf("MSIE")!=-1);},
	eventObject:function(eObj){
		if(!eObj){eObj=window.Event;} //obtaining the correct event object
		if(!eObj.target){eObj.target=eObj.srcElement;}  //obtaining the correct source element
		if(!eObj.which){eObj.which=eObj.keyCode;} //obtaining the correct keyCode tracker
	},
	addEvent:function(elem,eventname,actiondef){
		if(!DOMTools.BrowserIsMSIE()){
			elem.addEventListener(eventname,actiondef,false);
		}else{
			elem.attachEvent("on"+eventname,actiondef);
		}
	},
	removeEvent:function(elem,eventname,actiondef){
		if(!DOMTools.BrowserIsMSIE()){
			elem.removeEventListener(eventname,actiondef,false);
		}else{
			elem.detachEvent("on"+eventname,actiondef);
		}
	}
};

var doInputFocusAction=function(e){
DOMTools.eventObject(e);
var elem=e.target;
if(elem && elem.value && elem.getAttribute("defStr") && elem.value===elem.getAttribute("defStr")){
elem.value="";
elem.style.color="rgb(0,0,0)";
}
};

var doInputBlurAction=function(e){
DOMTools.eventObject(e);
var elem=e.target;
if(elem && elem.getAttribute("defStr") && elem.value===""){
elem.value=elem.getAttribute("defStr");
elem.style.color="rgb(137,137,137)";
}
};

var EUtils={};
EUtils.ui={
	placeHolder:function(inputElem){
		if(inputElem && inputElem.getAttribute("defStr")){
			inputElem.value=inputElem.getAttribute("defStr");
			inputElem.style.color="rgb(137,137,137)";
			DOMTools.addEvent(inputElem,"focus",doInputFocusAction);
			DOMTools.addEvent(inputElem,"blur",doInputBlurAction);
		}
	}
};