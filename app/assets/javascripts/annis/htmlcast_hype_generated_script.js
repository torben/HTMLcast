//	HYPE.documents["htmlcast"]

(function HYPE_DocumentLoader() {
	var resourcesFolderName = "assets/annis";
	var documentName = "htmlcast";
	var documentLoaderFilename = "htmlcast_hype_generated_script.js";

	// find the URL for this script's absolute path and set as the resourceFolderName
	try {
		var scripts = document.getElementsByTagName('script');
		for(var i = 0; i < scripts.length; i++) {
			var scriptSrc = scripts[i].src;
			if(scriptSrc != null && scriptSrc.indexOf(documentLoaderFilename) != -1) {
				resourcesFolderName = scriptSrc.substr(0, scriptSrc.lastIndexOf("/"));
				break;
			}
		}
	} catch(err) {	}

	// load HYPE.js if it hasn't been loaded yet
	if(typeof HYPE == "undefined") {
		if(typeof window.HYPE_DocumentsToLoad == "undefined") {
			window.HYPE_DocumentsToLoad = new Array();
		}
		window.HYPE_DocumentsToLoad.push(HYPE_DocumentLoader);

		var headElement = document.getElementsByTagName('head')[0];
		var scriptElement = document.createElement('script');
		scriptElement.type= 'text/javascript';
		scriptElement.src = resourcesFolderName + '/' + 'HYPE.js';
		headElement.appendChild(scriptElement);
		return;
	}
	
	var attributeTransformerMapping = {"BorderColorRight":"ColorValueTransformer","BackgroundColor":"ColorValueTransformer","BorderWidthBottom":"PixelValueTransformer","WordSpacing":"PixelValueTransformer","BoxShadowXOffset":"PixelValueTransformer","Opacity":"FractionalValueTransformer","BorderWidthRight":"PixelValueTransformer","BorderWidthTop":"PixelValueTransformer","BoxShadowColor":"ColorValueTransformer","BorderColorBottom":"ColorValueTransformer","FontSize":"PixelValueTransformer","BorderRadiusTopRight":"PixelValueTransformer","TextColor":"ColorValueTransformer","Rotate":"DegreeValueTransformer","Height":"PixelValueTransformer","PaddingLeft":"PixelValueTransformer","BorderColorTop":"ColorValueTransformer","Top":"PixelValueTransformer","BackgroundGradientStartColor":"ColorValueTransformer","TextShadowXOffset":"PixelValueTransformer","PaddingTop":"PixelValueTransformer","BackgroundGradientAngle":"DegreeValueTransformer","PaddingBottom":"PixelValueTransformer","PaddingRight":"PixelValueTransformer","Width":"PixelValueTransformer","TextShadowColor":"ColorValueTransformer","BorderColorLeft":"ColorValueTransformer","ReflectionOffset":"PixelValueTransformer","Left":"PixelValueTransformer","BorderRadiusBottomRight":"PixelValueTransformer","LineHeight":"PixelValueTransformer","BoxShadowYOffset":"PixelValueTransformer","ReflectionDepth":"FractionalValueTransformer","BorderRadiusTopLeft":"PixelValueTransformer","BorderRadiusBottomLeft":"PixelValueTransformer","TextShadowBlurRadius":"PixelValueTransformer","TextShadowYOffset":"PixelValueTransformer","BorderWidthLeft":"PixelValueTransformer","BackgroundGradientEndColor":"ColorValueTransformer","BoxShadowBlurRadius":"PixelValueTransformer","LetterSpacing":"PixelValueTransformer"};

var scenes = [{"initialValues":{"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91":{"BorderWidthBottom":"1px","TagName":"div","BorderColorBottom":"#A0A0A0","Opacity":"0.010000","BorderStyleRight":"Solid","BorderStyleBottom":"Solid","Top":"94px","BorderWidthRight":"1px","BorderStyleLeft":"Solid","BorderColorTop":"#A0A0A0","BorderColorLeft":"#A0A0A0","Position":"absolute","Height":"15px","Left":"87px","BorderColorRight":"#A0A0A0","BorderStyleTop":"Solid","ZIndex":"2","Width":"24px","BorderWidthTop":"1px","Overflow":"visible","BorderWidthLeft":"1px","BackgroundColor":"#def"},"E9BEB959-9187-4DAD-B6B5-04105E04D08C-1104-000005A90F029B99":{"Position":"absolute","BackgroundOrigin":"content-box","Left":"0px","Display":"inline","BackgroundImage":"Pasted.png","Height":"95px","Overflow":"visible","BackgroundSize":"100% 100%","ZIndex":"1","Top":"0px","Width":"201px","Opacity":"0.000000","TagName":"div"},"616F6D32-0FBF-47E3-B3CD-81114BF87449-1104-000006B9FD97C402":{"BorderWidthBottom":"1px","TagName":"div","BorderColorBottom":"#A0A0A0","Cursor":"pointer","Opacity":"0.000000","BorderStyleRight":"Solid","BorderStyleBottom":"Solid","Top":"-2px","BorderWidthRight":"1px","BorderStyleLeft":"Solid","BorderColorTop":"#A0A0A0","BorderColorLeft":"#A0A0A0","Position":"absolute","Height":"95px","Left":"0px","BorderColorRight":"#A0A0A0","ActionOnMouseClick":{"type":4,"javascriptOid":"9AE2E673-EF2A-422A-970C-10BCB60E1232-1104-000006CB60652850"},"BorderStyleTop":"Solid","ZIndex":"3","Width":"199px","BorderWidthTop":"1px","Overflow":"visible","BorderWidthLeft":"1px","BackgroundColor":"#FFFFFF"}},"timelines":{"kTimelineDefaultIdentifier":{"framesPerSecond":30,"animations":[{"startValue":"0.000000","isRelative":true,"endValue":"1.000000","identifier":"Opacity","duration":4.833333,"timingFunction":"easeinout","type":0,"oid":"E9BEB959-9187-4DAD-B6B5-04105E04D08C-1104-000005A90F029B99","startTime":0},{"startValue":"0px","isRelative":true,"endValue":"0px","identifier":"Top","duration":7.2,"timingFunction":"easeinout","type":0,"oid":"E9BEB959-9187-4DAD-B6B5-04105E04D08C-1104-000005A90F029B99","startTime":0},{"startValue":"0.010000","isRelative":true,"endValue":"1.000000","identifier":"Opacity","duration":0.5999999,"timingFunction":"easeinout","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":4.833333},{"startValue":"24px","isRelative":true,"endValue":"198px","identifier":"Width","duration":2.366666,"timingFunction":"easeinout","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":4.833333},{"startValue":"87px","isRelative":true,"endValue":"0px","identifier":"Left","duration":2.366666,"timingFunction":"easeinout","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":4.833333},{"startValue":"1.000000","isRelative":false,"endValue":"1.000000","identifier":"Opacity","duration":3.3,"timingFunction":"easeinout","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":5.433333},{"startValue":"198px","isRelative":false,"endValue":"198px","identifier":"Width","duration":1.533334,"timingFunction":"easeinout","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":7.2},{"startValue":"0px","isRelative":false,"endValue":"0px","identifier":"Left","duration":1.533334,"timingFunction":"easeinout","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":7.2},{"startValue":"0px","isRelative":false,"endValue":"95px","identifier":"Top","duration":1.966667,"timingFunction":"easeinout","type":0,"oid":"E9BEB959-9187-4DAD-B6B5-04105E04D08C-1104-000005A90F029B99","startTime":7.2},{"startValue":"198px","isRelative":false,"endValue":"36px","identifier":"Width","duration":2.033333,"timingFunction":"easein","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":8.733334},{"startValue":"1.000000","isRelative":false,"endValue":"0.000000","identifier":"Opacity","duration":2.033333,"timingFunction":"easein","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":8.733334},{"startValue":"0px","isRelative":false,"endValue":"82px","identifier":"Left","duration":2.033333,"timingFunction":"easein","type":0,"oid":"64F2BB9C-8CA5-4EE6-B4B4-AB6211E66613-1104-000005E9B5C6DB91","startTime":8.733334}],"identifier":"kTimelineDefaultIdentifier","name":"Main Timeline","duration":10.76667}},"id":"94429F4A-3AC7-4441-BF5D-280F86238918-1104-000005A580BE6FDD","sceneIndex":0,"perspective":"600px","oid":"94429F4A-3AC7-4441-BF5D-280F86238918-1104-000005A580BE6FDD","onSceneAnimationCompleteAction":{"type":1,"transition":1,"sceneSymbol":3},"name":"Untitled Scene","backgroundColor":"#FFFFFF"}];

var javascriptMapping = {"9AE2E673-EF2A-422A-970C-10BCB60E1232-1104-000006CB60652850":"linkToHome"};


	
	var Custom = (function() {
	return {

linkToHome : function(hypeDocument, element) {
	alert('test')	
}
	};
}());

	
	var hypeDoc = new HYPE();
	
	hypeDoc.attributeTransformerMapping = attributeTransformerMapping;
	hypeDoc.scenes = scenes;
	hypeDoc.javascriptMapping = javascriptMapping;
	hypeDoc.Custom = Custom;
	hypeDoc.currentSceneIndex = 0;
	hypeDoc.mainContentContainerID = "htmlcast_hype_container";
	hypeDoc.resourcesFolderName = resourcesFolderName;
	hypeDoc.showHypeBuiltWatermark = 0;
	hypeDoc.showLoadingPage = false;
	hypeDoc.drawSceneBackgrounds = true;
	hypeDoc.documentName = documentName;

	HYPE.documents[documentName] = hypeDoc.API;

	hypeDoc.documentLoad(this.body);
}());

