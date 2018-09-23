<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="content">
    <h4>Edit Part</h4>
        <form:form method = "POST" action = "/edit">
            <table>
                <form:input path = "id" value="${part.id}" type="hidden" />
                <div class="form-group">
                    <tr>
                        <td><form:label path = "name">Name</form:label></td>
                        <td><form:input maxlength="256" path = "name" class="form-control" value ="${part.name}"/></td>
                    </tr>
                </div>
                <div class="form-group">
                    <tr>
                        <td><label path = "quantity">Quantity</label></td>
                        <td><form:input maxlength="9" path = "quantity" class="form-control" value ="${part.quantity}"/></td>
                    </tr>
                </div>
                <div class="form-group">
                    <tr>
                        <td><label path = "necessity">Required</label></td>
                        <td><form:checkbox  class="form-control" path = "necessity"/></td>
                    </tr>
                </div>
                <div class="form-group">
                    <tr>
                        <td colspan = "2">
                            <input type = "submit" class="btn btn btn-secondary" value = "Submit"/>
                        </td>
                    </tr>
                </div>
            </table>
        </form:form>
</rapid:override>

<%@ include file="base.jsp" %>
