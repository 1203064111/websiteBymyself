<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>   
<title>标题页</title>   
<script type="text/css">  
</script>  
</head>   
<body>   
<table border="0" cellpadding="0" cellspacing="0">   
    <tr>   
        <td>div:</td>  
        <td style="position:relative;">   
        <input type="text" id="txtRegion"  style="width:220px; background-color:#fff;"/>   
         <div id="divList" style="display: none; position: absolute ; left:228px; top:0px; border: 1px solid black; overflow: hidden; height: 150px; position: absolute; background-color:#FFFFFF; ">   
                <table width="100%" border="0" cellpadding="0" cellspacing="0">   
                    <tr>   
                        <td>   
                               <div id="contentDiv"  style="overflow: auto; padding-left:0; width: 100%; height: 150px; background-color: #FFFFFF; "></div>   
                        </td>   
                    </tr>   
                </table>     
          </div>   
        </td>   
    </tr>    
 </table>   
<script type="text/javascript">  
       var oRegion = document.getElementById("txtRegion");     //需要弹出下拉列表的文本框   
       var oDivList = document.getElementById("divList");         //要弹出的下拉列表  
       var contentD = document.getElementById("contentDiv") ;  
       //var oClose = document.getElementById("tdClose");   //关闭div的单元格，也可使用按钮实现   
       var QueryCode ="COPY_aibsm.enums.sm.receive.support_row" ;  
       var bNoAdjusted = true;   
       var html = "" ;   
       var all_html ="" ;  
       var colOptions = "" ;  
       $(document).ready(function(){  
              oRegion.style.background="url(/bomc3/jx/boms/busBackup/select2.jpg)  right -3px no-repeat";  
              oRegion.style.backgroundColor="#fff" ;  
              getJsonListFromCode(QueryCode,function(data){  
                      if(data!=null&&data!=""){           // 存在查询结果 ;  
                           $.each(data,function(i,e){  
                                   all_html +="<li style='text-align:left; padding-left:5px;'>"+e.VALUE+"</li>" ;  
                           }) ;  
                     }  
              },'') ;  
       }) ;  
       $(document).click(function (e) {            
          var target_id = $(e.target).attr('id') ;             // 获取点击dom元素id ;  
          if(target_id!=oRegion.id)  
          {  
                  oDivList.style.display = "none"; 
                  //隐藏div，实现关闭下拉框的效果 ;  
                 oRegion.style.background="url(/bomc3/jx/boms/busBackup/select2.jpg)  right -3px no-repeat";  
                  oRegion.style.backgroundColor="#fff" ;  
          }  
       }) ;  
       //设置下列选择项的一些事件   
       function setEvent(colOptions){  
              for (var i=0; i<colOptions.length; i++)   
              {   
                  colOptions[i].onclick = function()
                  //为列表项添加单击事件   
                  {   
                      oRegion.value = this.innerText;     //显示选择的文本；  
                      oRegion.style.backgroundColor="#219DEF" ;  
                      oDivList.style.display = "none";    
                  };   
                  colOptions[i].onmouseover = function()
                  //为列表项添加鼠标移动事件   
                  {   
                      this.style.backgroundColor = "#219DEF";   
                  };   
                  colOptions[i].onmouseout = function()  //为列表项添加鼠标移走事件   
                  {   
                      this.style.backgroundColor = "";   
                  };   
              }   
       }  
       //文本获得焦点时的事件   
       oRegion.onfocus = function()   
       {   
           oRegion.style.background="url(/bomc3/jx/boms/busBackup/select.jpg)  right -3px no-repeat";  
           oRegion.style.backgroundColor="#fff" ;  
           oDivList.style.display = "block";  
           if (bNoAdjusted)
        	   //控制div是否已经显示的变量   
           {   
               bNoAdjusted = false;   
               //设置下拉列表的宽度和位置   
               oDivList.style.width = this.offsetWidth - 4;   
               oDivList.style.posTop = oRegion.offsetTop + oRegion.offsetHeight + 1;          // 设定高度  
               oDivList.style.posLeft = oRegion.offsetLeft +1 ;               // 设定与左边的位置;  
           }   
       };   
        
       // 文本内容改变时监听事件 ;  
       oRegion.onpropertychange = function(){  
               contentD.innerHTML ="" ; // 情况div中所有li元素;  
               html ="" ;  
               InitializeDIV( oRegion.value) ;  
       }  
       function InitializeDIV(value){  
              var sql ="" ;  
              if(value!=""){  
                     html+= "<ul><li style='text-align:left; padding-left:3px;'>按"+'"'+"<font style='color :red;'>"+value+"</font>"+'"'+"检索:</li>";  
                     sql += 'value='+value ;  
              }else{  
                html+= "<ul><li style='text-align:left; padding-left:3px;'>请输入检索条件:"+"</li>";  
                     sql ="" ;  
              }  
              getJsonListFromCodeSync(QueryCode,function(data){  
                      if(data!=null&&data!=""){           // 存在查询结果 ;  
                           $.each(data,function(i,e){  
                                   html+="<li style='text-align:left; padding-left:3px;'>"+e.VALUE+"</li>" ;  
                           }) ;  
                      }else{         // 没有查询结果;  
                                  html ="" ;  
                                  html+= "<ul><li style='text-align:left; padding-left:3px;'>无法匹配:"+'"'+"<font style='color :red;'>"+value+"</font>"+'"'+"</li>";  
                                  html += all_html ;  
                      }  
                      html+="</ul>" ;  
              },sql) ;  
              contentD.innerHTML = html ;  
              colOptions = $("#contentDiv li") ; //所有列表元素  
              setEvent(colOptions) ;  
       }  
</script>  
</body> 
</html>