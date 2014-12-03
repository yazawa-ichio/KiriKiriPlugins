
[return cond="typeof(global.PatchDownloader_objct) != 'undefined'"]


[iscript]

KAGLoadScript("DownloadWindow.tjs");
KAGLoadScript("PDConfig.tjs");

class PatchDownloader
{
	/*C*/var version = 1.00;
	/*C*/var infoPath = "http://example.txt";
	/*C*/var encoding = "Shift-JIS";
	/*C*/var checkPatch = false;
	
	var DLversion = 1.00;
	var downloader;
	var PatchURL = "";
	var par;
	var win;
	var patchNum = "";
	var download = false;
	
	function PatchDownloader(window){
		
		(PDConfig incontextof this)()
			if typeof global.PDConfig != "undefined";
		this.par = window;
		downloader = new HttpRequest(window);
		downloader.onReadyStateChange = onReadyStateChange;
		if(checkPatch)
			start();
		if(Storages.isExistentStorage(System.exePath + "patch.xp3")){
			for(patchNum = 2;
				Storages.isExistentStorage(System.exePath + "patch" + patchNum + ".xp3");
				patchNum++);
			patchNum = "" + patchNum;
		}
		
	}
	function start(){
		if(PatchURL == ""){
			downloader.open('GET', infoPath);
			downloader.send();
		}else if(DLversion > version){
			patchDownload();
		}else{
			System.inform("�ŐV�̃o�[�W�����ł��B");
		}
	}
	function onReadyStateChange(readyState)
	{
		if(downloader.readyState == global.HttpRequest.LOADED && PatchURL == "")
		{
			if(downloader.responseData !== void){
				var info = [].split("\n", downloader.getResponseText(encoding), true);
				DLversion = + info[1];
				PatchURL = info[3];
				if(version < DLversion){
					patchDownload();
				}else{
					if(!checkPatch){
						System.inform("�ŐV�̃o�[�W�����ł��B");
					}
				}
			}else{
				if(!checkPatch){
					System.inform("�p�b�`��񂪃_�E�����[�h�o���܂���B");
				}else{
					kag.helpPatchDownload.visible = true;
					checkPatch = false;
				}
			}
		}
	}
	//�p�b�`��K������B
	function patchDownload()
	{
		if(askYesNo("�ŐV�̃p�b�`������܂��B�_�E�����[�h���܂����H")){
			DLWindow(PatchURL,System.exePath+"patch"+patchNum+".xp3",,"�p�b�`���_�E�����[�h���Ă��܂�");
			if(Storages.isExistentStorage(System.exePath+"patch"+patchNum+".xp3"))
				Storages.addAutoPath(System.exePath+"patch"+patchNum+".xp3>");
			KAGLoadScript("PDConfig.tjs");
			(PDConfig incontextof this)()
				if typeof global.PDConfig != "undefined";
		}
	}
}

global.PatchDownloader_objct = new PatchDownloader(kag);


kag.helpMenu.add(kag.helpPatchDownload = new KAGMenuItem(this, "�p�b�`���_�E�����[�h����", 0,
			global.PatchDownloader_objct.start, false));
kag.helpPatchDownload.visible = !global.PatchDownloader_objct.checkPatch;

[endscript]


[return]
