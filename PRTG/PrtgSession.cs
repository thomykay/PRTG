namespace ThomyKay.Prtg
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Net;

    /// <summary>
    /// Holds the information about a single session.
    /// </summary>
    public class PrtgSession
    {
        private string url;
        private NetworkCredential credential;

        /// <summary>
        /// Gets or sets the url.
        /// </summary>
        /// <value>The proxy.</value>
        public string Url
        {
            get
            {
                return url;
            }

            set
            {
                this.url = value;
            }
        }

        /// <summary>
        /// Gets or sets the credential.
        /// </summary>
        /// <value>The proxy.</value>
        public NetworkCredential Credential
        {
            get
            {
                return credential;
            }
            set
            {
                credential = value;
            }
        }
    }
}
