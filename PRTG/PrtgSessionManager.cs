namespace ThomyKay.Prtg
{
  using System;
  using System.Collections.Generic;
  using System.Text;

  /// <summary>
  /// Holds a list of sessions.
  /// </summary>
  public class PrtgSessionManager
  {
    private List<PrtgSession> sessions = new List<PrtgSession>();
    private PrtgSession currentSession;

    /// <summary>
    /// Gets or sets the sessions.
    /// </summary>
    /// <value>The sessions.</value>
    public List<PrtgSession> Sessions
    {
      get { return sessions; }
    }

    /// <summary>
    /// Gets or sets the current session.
    /// </summary>
    /// <value>The current session.</value>
    public PrtgSession CurrentSession
    {
      get
      {
        return currentSession;
      }
      set
      {
        currentSession = value;
      }
    }

    public PrtgSession Enter(PrtgSession session)
    {
      if (!this.Sessions.Contains(session))
      {
        this.Sessions.Add(session);
      }

      this.CurrentSession = session;

      return session;
    }

    public void Remove(PrtgSession session)
    {
      if (this.Sessions.Contains(session))
      {
        this.Sessions.Remove(session);
      }

      if (this.CurrentSession == session)
      {
        this.CurrentSession = null;
      }
    }
  }
}
