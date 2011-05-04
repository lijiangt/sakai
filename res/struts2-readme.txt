Java Code:
package org.sakaiproject.res.actions;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.sakaiproject.res.api.FileService;
import org.sakaiproject.res.api.LogService;
import org.sakaiproject.tool.api.Placement;
import org.sakaiproject.tool.api.ToolManager;
import org.springframework.beans.factory.annotation.Required;

import com.opensymphony.xwork2.ActionSupport;

@Results({
	@Result(name = "success", location = "/portal/tool/${toolId}/index.action", type="redirect", params={"prependServletContext","false"})
	})
public class FileAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5359805975527641487L;

	private FileService fileService;
	
	private LogService logService;
	@Required()
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	@Required()
	public void setLogService(LogService logService) {
		this.logService = logService;
	}
	
	private String toolId;
	
	
	
	public String getToolId() {
		return toolId;
	}
	public String add(){
		
		return "add";
	}
	public String save(){
		ToolManager toolManager = org.sakaiproject.tool.cover.ToolManager.getInstance();
		Placement currentPlacement = toolManager.getCurrentPlacement();
		toolId = currentPlacement.getId();
		return "success";
	}
}




JSP Code:
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>index</title>
    <%= request.getAttribute("sakai.html.head") %>
</head>

<body onload="<%= request.getAttribute("sakai.html.body.onload") %>">
<h2>hello world!</h2>

<s:form action="./file!save.action" method="POST" enctype="multipart/form-data"> 
    <s:file name ="file" label ="File" /> 
        <s:textfield name ="caption" label ="Caption" />        
        <s:submit /> 
    </s:form >

</body>
</html>

Warn Info:
2011-05-04 14:27:05,328  WARN http-8080-Processor20 org.apache.struts2.components.ServletUrlRenderer - No configuration found for the specified action: './file' in namespace: '/'. Form action defaulting to 'action' attribute's literal value.