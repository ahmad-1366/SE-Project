using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SessionState
/// </summary>
public class SessionState
{
    private static int activeUserid = 4;
    private static int activeRequestid = 3;
    public static void setActiveUser(int userid)
    {
        activeUserid = userid;
    }
    public static int getActiveUserid()
    {
        return activeUserid;
    }
    public static int getActiveRequestid()
    {
        return activeRequestid;
    }
    public static void setActiveRequestid(int requestid)
    {
        activeRequestid = requestid;
    }
}