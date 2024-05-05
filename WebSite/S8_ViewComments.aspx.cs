using System;
using System.Linq;
using System.Collections.Generic;
using System.Web.UI.WebControls;

public partial class S8_ViewComments: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int userid = SessionState.getActiveUserid();
            List<Comment> list = Comment.GetCommentsList(userid);
            loadCommentsList(list);
        }
    }
    private void loadCommentsList(List<Comment> list)
    {
        CommentsList.DataSource = list.Select(obj => new
        {
            Description = obj.getDescription(),
            CmtSource = obj.getSource(),
            TimePassed = obj.getTimePassed()
        }).ToList();
        CommentsList.DataBind();
    }
}