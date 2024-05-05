using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

public partial class A2_ViewNotifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Notification> list = Notification.getGroupCommentsList("Admin");
            loadCommentsList(list);
        }
    }
    private void loadCommentsList(List<Notification> list)
    {
        CommentsList.DataSource = list.Select(obj => new
        {
            Description = obj.getDescription(),
            TimePassed = obj.getTimePassed()
        }).ToList();
        CommentsList.DataBind();
    }
}