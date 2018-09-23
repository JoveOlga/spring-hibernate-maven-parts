<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="content">
    <h4>Part Information</h4>
    <form:form method = "POST" action = "/add">
        <table>
            <div class="form-group">
                <tr>
                    <td><form:label path = "name">Name</form:label></td>
                    <td><form:input maxlength="256" class="form-control" path = "name"/></td>
                </tr>
            </div>
            <div class="form-group">
                <tr>
                    <td><form:label path = "quantity">Quantity</form:label></td>
                    <td><form:input maxlength="9" class="form-control" path = "quantity" /></td>
                </tr>
            </div>
            <div class="form-group">
                <tr>
                    <td><form:label path = "necessity">Required</form:label></td>
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

