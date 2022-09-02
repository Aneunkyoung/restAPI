<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Blog</title>
        <!-- UIkit CSS -->
        <link
        rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.15.5/dist/css/uikit.min.css"/>
        <!-- UIkit JS -->
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.5/dist/js/uikit.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.5/dist/js/uikit-icons.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
    </head>
    <body>
        <div class="content" style="margin: 100px 250px 250px 265px;">
            <h2 style="margin-bottom:50px"><input id="boardCount" class="uk-input uk-form-width-medium" type="label" style="padding:0; color:#333333;border:none"></h2>
            <div id="boardList"></div>
            <script id="template" type="text/x-handlebars-template">
                {{#each .}}
                    <article class="uk-comment" style="margin-bottom:80px">
                        <header class="uk-comment-header">
                            <div class="uk-grid-medium uk-flex-middle" uk-grid="uk-grid">
                                <div class="uk-width-auto">
                                    <img class="uk-comment-avatar" src="https://cdn-icons-png.flaticon.com/512/552/552721.png" width="80" height="80" alt=""></div>
                                <div class="uk-width-expand">
                                    <h4 class="uk-comment-title uk-margin-remove">
                                        <a class="uk-link-reset" href="#">{{ name }}</a>
                                    </h4>
                                    <ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
                                        <li>
                                            <a href="#">{{ regdate }}</a>
                                        </li>
                                        <li>
                                            <a onclick="modify({{no}});">Edit</a>
                                        </li>
                                        <li>
                                            <a onclick="remove({{no}});">Delete</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </header>
                        <div class="uk-comment-body" style="padding-left: 110px;">
                            <p>{{ content }}</p>
                        </div>
                    </article>
                {{/each}}
            </script>
            <ul id="paging" class="uk-pagination uk-flex-center" uk-margin></ul>
            <form id="boardWriteForm">
                <fieldset class="uk-fieldset">
                    <legend class="uk-legend">Comment</legend>
                    <div class="uk-margin">
                        <input id="name" class="uk-input uk-form-width-medium" type="text" placeholder="Write Name!">
                    </div>
                    <div class="uk-margin">
                        <textarea id="content" class="uk-textarea" rows="5" placeholder="Write Comment!"></textarea>
                    </div>
                </fieldset>
                <button id="boardWriteFormBtn" class="uk-button uk-button-secondary" style="float:right" type="submit">Submit</button>
            </form>
            
            <form id="boardWriteUpdateForm">
                <fieldset class="uk-fieldset">
                    <legend class="uk-legend">Update Comment</legend>
                    <div class="uk-margin">
                        <input id="no" class="uk-input uk-form-width-medium" type="hidden">
                        <input id="updateName" class="uk-input uk-form-width-medium" type="text" placeholder="Write Name!">
                    </div>
                    <div class="uk-margin">
                        <textarea id="updateContent" class="uk-textarea" rows="5" placeholder="Write Comment!"></textarea>
                    </div>
                </fieldset>
                <button id="boardWriteUpdateFormBtn" class="uk-button uk-button-secondary" style="float:right" type="submit">Submit</button>
            </form>
        </div>
    </body>
    
    <script type="text/javascript">
        var page = 1;
        boardDisplay(page);
        $("#boardWriteUpdateForm").hide();
        
        /* 게시글 조회 */
        function boardDisplay(pageNum) {
            page = pageNum;
            $.ajax({
                type: "get",
                url: "board_list?pageNum=" + pageNum,
                dataType: "json",
                success: function (json) {
                    if (json.boardList.length == 0) {
                        alert("작성된 게시글이 없습니다!");
                        return;
                    }
                    var source = $("#template").html();
                    var template = Handlebars.compile(source);
                    $("#boardList").html(template(json.boardList));
                    $("#boardCount").val("Blog("+json.commentCount+")");
                    pageDisplay(json.pager);
                },
                error: function (xhr) {
                    alert("에러코드 = " + xhr.status);
                }
            });
        }
        
        /* 페이지 출력 */
        function pageDisplay(pager) {
            var html = "";
            if (pager.startPage > pager.blockSize) {
                html += "<a href='javascript:boardDisplay(1);'><span class='uk-margin-small-right' uk-pagination-previous></span> First</a>";
                html += "<a href='javascript:boardDisplay(" + pager.prevPage + ");'><li><span uk-pagination-previous></li></a>";
            } else {
                html += "<span class='uk-margin-small-right' uk-pagination-previous></span> First<li><span uk-pagination-previous></li>";
            }
            for (i = pager.startPage; i <= pager.endPage; i ++) {
                if (pager.pageNum != i) {
                    html += "<li><a href='javascript:boardDisplay(" + i + ");'>" + i + "</a></li>";
                } else {
                    html += "<li>" + i + "</li>";
                }
            }
            if (pager.endPage != pager.totalPage) {
                html += "<a href='javascript:boardDisplay(" + pager.nextPage + ");'><li><span uk-pagination-next></li></a>";
                html += "<a href='javascript:boardDisplay(" + pager.totalPage + ");'>Last <span class='uk-margin-small-left' uk-pagination-next></span></a>";
            } else {
                html += "<li><span uk-pagination-next></li>Last <span class='uk-margin-small-left' uk-pagination-next></span>";
            }
            $("#paging").html(html);
        }
        
        /* 게시글 등록 */
        $('#boardWriteFormBtn').click(function () {
        	var name = $("#name").val();
        	var content = $("#content").val();

            if ($("#name").val() == '') {
                $("#name").focus();
                alert("Write Name!");
                return false;
            }
            if ($("#content").val() == '') {
                $("#content").focus();
                alert("Write content!");
                return false;
            }
            $.ajax({
    			type: "post",
    			url: "board_add",
    			contentType: "application/json",
    			data: JSON.stringify({"name":name,"content":content}),
    			dateType: "text",
    			success: function(text) {
    				if(text=="success") {
    					$("#name").val() == '';
                    	$("#content").val() == '';
    					boardDisplay(1);
    				}
    			}, 
    			error: function(xhr) {
    				alert("에러코드 = "+xhr.status);
    			}
    		});
        });
        
        /* 게시글 변경 */
        function modify(no) {
        	$("#boardWriteForm").hide();
        	$("#boardWriteUpdateForm").show();
        	$("#updateName").focus();
        	
        	$.ajax({
    			type: "get",
    			url: "board_view?no="+no,
    			dataType: "json",
    			success: function(json) {
    				$("#no").val(json.no);
    				$("#updateName").val(json.name);
    				$("#updateContent").val(json.content);
    			}, 
    			error: function(xhr) {
    				alert("에러코드 = "+xhr.status);
    			}
    		});
		}
        
        /* 게시글 변경 Submit */
        $("#boardWriteUpdateFormBtn").click(function() {
    		var no=$("#no").val();
    		var name=$("#updateName").val();
    		var content=$("#updateContent").val();

    		if(name=="") {
    			name.focus();
    			alert("Write Name!");
    			return false;
    		}
    		
    		if(content=="") {
    			content.focus();
    			alert("Write Content!");
    			return false;
    		}
    		
    		$.ajax({
    			type: "put",
    			url: "board_modify",
    			contentType: "application/json",
    			data: JSON.stringify({"no":no,"name":name,"content":content}),
    			dateType: "text",
    			success: function(text) {
    				if(text=="success") {
    					$("#updateName").val() == '';
                    	$("#updateContent").val() == '';
    					$("#boardWriteUpdateForm").hide();
    					boardDisplay(page);
    				}
    			}, 
    			error: function(xhr) {
    				alert("에러코드 = "+xhr.status);
    			}
    		});
    	});
        
        /* 게시글 삭제 */
        function remove(no) {
    		if(confirm("Delete " + no + " board?")) {
    			$.ajax({
    				type: "delete",
    				url: "board_remove?no="+no,
    				dataType: "text",
    				success: function(text) {
    					if(text=="success") {
    						boardDisplay(1);
    					}
    				}, 
    				error: function(xhr) {
    					alert("에러코드 = "+xhr.status);
    				}
    			});
    		}
    	}
    </script>
</html>
