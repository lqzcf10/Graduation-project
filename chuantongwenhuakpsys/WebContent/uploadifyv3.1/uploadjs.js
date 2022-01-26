  alert($('#btnulTupian'));
  
 $(document).ready(function() {
 $('#btnulTupian').uploadify({  
			                'formData' { 'folder' 'chuantongwenhuakpsysUpload' },  
			                'buttonText' 'ѡ��ͼƬ',  
			                'buttonClass' 'browser',  
			                'removeCompleted' true,  
			                'swf' 'chuantongwenhuakpsysuploadifyv3.1uploadify.swf', 
			                'fileTypeExts'.jpg;.gif;.png;,
			                'auto'true, 
			                'removeTimeout'0,
			                'debug' false,  
			                'height' 15,  
			                'width'90,  
			                'uploader' 'uploadImg.action',
			                 'fileSizelimit''2048KB',
			                 'queueSizelimit''5',
			                 'onUploadSuccess'function(file, data, response){
			                     $(#filelist).show();
			                     $(#imgTupian).attr(src,chuantongwenhuakpsysuploadtemp+file.name);
                                 $(#hidTupian).val(chuantongwenhuakpsysuploadtemp+file.name);
			                  }
			             });
			             
			              });
			             
			             
			             
			             
			             
			             $(document).ready(function() {
        $('#btnulTupian').uploadify( {
            'debug''false',
            'swf'  'chuantongwenhuakpsysuploadifyv3.1uploadify.swf',�ϴ���ť��ͼƬ��Ĭ�������flash�ļ�
            'uploader'  'uploadImg.action',�ϴ�����ķ�����
            'cancelImg'  'chuantongwenhuakpsysuploadifyv3.1uploadify-cancel.png',ȡ��ͼƬ
            'method''post',
            'folder'  'chuantongwenhuakpsysupfile',�ϴ�������ļ���·��
            'queueID'  'fileQueue',�ϴ���ʾ��������Ǹ�div
            'buttonText'  '��ѡ���ļ�',
            'fileSizelimit''2048KB',
            'onUploadComplete' function(file){alert('The file'+file.name+'finished processing!')},ÿ���ļ��ϴ��ɹ���ĺ���
            'auto'  false,
            'multi'  true,
            'onSelect'function(file){
            alert(�ļ�+file.name+��ѡ���ˣ�);
            }
            'onQueueComplete'  function(queueData) {
                alert(queueData.filesQueued + 'files were successfully!')
            },�������е������ļ��ϴ��ɹ��󣬵������ж��ٸ��ļ��ϴ��ɹ�
            'onDisable'  function() {
                alert('uploadify is disable');
            },�ڵ���disable����ʱ�򴥷�
            'onCancel'function(){alert('��ȡ�����ļ��ϴ�')}
            'onUploadStart'  function(file) {�ڵ����ϴ�ǰ����
            alert('The file ' + file.name + ' is being uploaded.')}
            'onError'  function(errorType,errObj) {
                alert('The error was ' + errObj.info)
            }
 
        });
    });
 