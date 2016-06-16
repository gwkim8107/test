<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/sample/include_header.jsp" %>
</head>
<body>
    <table class="table">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="15%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>
            	<th scope="col">국가코드</th>
				<th scope="col">국가이름</th>
				<th scope="col">대륙코드</th>
            </tr>
        </thead>
        <tbody>
             
        </tbody>
    </table>
     
    <div id="PAGE_NAVI"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
     
    <br/>
    <a href="#this" class="btn" id="write">Write</a>
     
    <%@ include file="/WEB-INF/jsp/sample/include_bottom.jsp" %>
    <script type="text/javascript">
        $(document).ready(function(){
            fn_selectBoardList(1);
             
            $("#write").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openBoardWrite();
            }); 
             
            $("a[name='title']").on("click", function(e){ //제목 
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
        });
         
         
        function fn_openBoardWrite(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
            comSubmit.submit();
        }
         
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
            comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
            comSubmit.submit();
        }
         
        function fn_selectBoardList(pageNo){
            var comAjax = new ComAjax(); 
            comAjax.setUrl("<c:url value='/sample/sampleList.do' />");
            comAjax.setUrl("<c:url value='./sample/sampleList.do' />");
            comAjax.setCallback("fn_selectBoardListCallback");
            comAjax.addParam("PAGE_INDEX",pageNo);
            comAjax.addParam("PAGE_ROW", 15);
            comAjax.ajax();
        }
         
        function fn_selectBoardListCallback(data){
            var total = data.TOTAL;
            alert('total'+total);
            var body = $("table>tbody");
            body.empty();
            if(total == 0){
                var str = "<tr>" + 
                                "<td colspan='4'>조회된 결과가 없습니다.</td>" + 
                            "</tr>";
                body.append(str);
            }
            else{
                var params = {
                    divId : "PAGE_NAVI",
                    pageIndex : "PAGE_INDEX",
                    totalCount : total,
                    eventName : "fn_selectBoardList"
                };
                gfn_renderPaging(params);
                 
                var str = "";
                $.each(data.list, function(key, value){
                    str += "<tr>" +  
                                "<td>" + value.ID + "</td>" + 
                                "<td class='title'>" +
                                    "<a href='#this' name='CountryName'>" + value.CountryName + "</a>" +
                                    "<input type='hidden' name='title' value=" + value.ID + ">" + 
                                "</td>" +
                                "<td>" + value.HIT_CNT + "</td>" + 
                                "<td>" + value.CREA_DTM + "</td>" + 
                            "</tr>";
                });
                body.append(str);
                 
                $("a[name='title']").on("click", function(e){ //제목 
                    e.preventDefault();
                    fn_openBoardDetail($(this));
                });
            }
        }
    </script> 
</body>
</html>