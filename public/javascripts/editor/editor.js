/*
* InstantSferyx for WebApps - immediate integration plugin for the any WebApp
* this is an easy to integrate wrapper for the Sferyx JSyndrome HTMLEditor Applet http://www.sferyx.com
*/

var SferyxEditor = function(instanceName, width, height, toolbarSet, value) {
    this.InstanceName = instanceName;
    this.Width = width || '95%';
    this.Height = height || window.innerHeight * 0.85;
    this.ToolbarSet = toolbarSet || 'newFileButton, openFileButton, saveFileButton, styleClasses';
    this.Value = value || '';

};

//no longer used :
var allowLeaveWindow = 1;

//this var saves node path to currently opened textarea
var emplacementTextArea = document.getElementById("test");

SferyxEditor.prototype.ReplaceTextarea = function() {

    var _info = navigator.userAgent;
    var _ie = (_info.indexOf("MSIE") > 0 && _info.indexOf("Win") > 0 && _info.indexOf("Windows 3.1") < 0);

    var appletJarName = '/javascripts/editor/HTMLEditorAppletLight.jar';

    //var fieldName=document.getElementById(this.InstanceName).name;
    var appletString = '' 
    + '<applet code="sferyx.administration.editors.HTMLEditor" archive="' + appletJarName + '" style="width:' + this.Width + ';height:' + this.Height + ';" width="' + this.Width + '" height="' + this.Height + '" name="sfrx_htmleditor" id="' + this.InstanceName + '">' 
    + 'To start Sferyx HTML Editor applet Java Plug-in 1.4 is required. Get it here: http://java.sun.com/products/plugin/1.4/plugin-install.html' 
    + '<PARAM NAME ="supressRemoteFileDialog" VALUE="false">' 
    + '<PARAM NAME ="supressLocalFileDialog" VALUE="false">' 
    + '<PARAM NAME ="initialURLEncodedContent" VALUE="' + encodeURIComponent(document.getElementById(this.InstanceName.replace('_sferyx', '')).value) + '">' 
    + '<PARAM NAME ="uploadContentAsMultipartFormData" VALUE="true">' 
    + '<PARAM NAME ="saveURL" VALUE="http://192.168.15.3/uploadFile">' 
    + '<PARAM NAME ="generateUniqueImageFilenames" VALUE="true">' 
    + '<PARAM NAME="useSaveAsSaveRemote" VALUE="true">' 
    + //'<PARAM NAME ="useFixedFileNameNamingRule" VALUE="NewFile">'
    + '<PARAM NAME = "uploadedObjectsTranslationPath" VALUE="http://192.168.15.3/upload">' 
    + '<PARAM NAME="useFlowToolbarLayout" VALUE="true">' 
    + '<PARAM name="mainMenuVisible"  value="false">' 
    + '<PARAM name="statusbarVisible"  value="false">' 
    + '<PARAM name="sourceEditorVisible"  value="false">' 
    + '<PARAM name="previewVisible"  value="false">' 
    + ' <PARAM NAME="singleParagraphSpacing" VALUE="true">' 
    + '<PARAM name="toolbarItemsToRemove"  value="' + this.ToolbarSet + '">' 
    + '</applet>';

    if (_ie) {
        document.getElementById(this.InstanceName.replace('_sferyx', '_temp')).outerHTML = appletString;
    }
    else {

        var myTextField = document.getElementById(this.InstanceName.replace('_sferyx', '_temp'));
        var r = myTextField.ownerDocument.createRange();
        r.setStartBefore(myTextField);
        var df = r.createContextualFragment(appletString);
        myTextField.parentNode.replaceChild(df, myTextField);
    }

    /*
	//remove mce editor if needed
	try
	{
	var element = document.getElementById(this.InstanceName+"_parent");
	element.parentNode.removeChild(element);
	}
	catch(err)
	{}
	*/
};

SferyxEditor.prototype.UploadData = function() {

    var htmlEditor = document.getElementById(this.InstanceName);
    htmlEditor.saveToDefaultLocation();

};

SferyxEditor.prototype.ReplaceEditor = function(name) {
    var htmlEditor = document.getElementById(this.InstanceName);

    var currentContent = htmlEditor.getBodyContent();

    $("#" + this.InstanceName.replace('_sferyx', '_html')).html(currentContent);
    console.log("#" + this.InstanceName.replace('_sferyx', ''));
    $("#" + this.InstanceName.replace('_sferyx', ''))[0].value = currentContent;

    //find if there are changes
    if (document.applets[0].isDocumentEdited()) {
        allowLeaveWindow = 0;
    }

    htmlEditor.parentNode.removeChild(htmlEditor);

    var _info = navigator.userAgent;
    var _ie = (_info.indexOf("MSIE") > 0 && _info.indexOf("Win") > 0 && _info.indexOf("Windows 3.1") < 0);

    //var fieldString='<textarea name="'+name+'" id="'+this.InstanceName+'" style="width:100%;height:300px">'+currentContent+'</textarea>';    
    //might be a problem if using IE
    //var r = htmlEditor.ownerDocument.createRange();
    //r.setStartBefore(htmlEditor);
    //var df = r.createContextualFragment(fieldString);
    //old version : htmlEditor.parentNode.replaceChild(df, htmlEditor);
    //replace the editor at the right place
    //emplacementTextArea.appendChild(df);
    //delete html editor
    //old stuff
    //var textField = document.getElementById(this.InstanceName);
    //textField.value=currentContent;
    //places the text editor
    //tinyMCE.execCommand('mceAddControl', false, this.InstanceName);
};

function CommitChanges() {
    allowLeaveWindow = 1;
}

var ed;
//Show popup
function DisplayPopUpEditor(TextAreaID, TextAreaName) {
    //remove mce editor
    //tinyMCE.execCommand('mceRemoveControl', true, TextAreaID);
    //get the initial textarea position
    emplacementTextArea = document.getElementById(TextAreaID).parentNode;
    var a = $("#" + TextAreaID).clone();
    a.attr("id", TextAreaID + "_temp");
    a.dialog({
        minHeight: window.innerHeight - 100,
        width: window.innerWidth - 100,
        modal: true,
        title: 'Edition',
        open: function(event, ui) {
            ed = new SferyxEditor(TextAreaID + '_sferyx');
            ed.ReplaceTextarea();

        },
        beforeClose: function(event, ui) {
            ed.UploadData();
            ed.ReplaceEditor(TextAreaName);
        }
    });

}