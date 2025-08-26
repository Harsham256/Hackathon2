using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Hackathon2Asp
{
    public partial class Qn1 : Page
    {
        private Dictionary<string, string> Words
        {
            get
            {
                if (Session["Words"] == null)
                {
                    Session["Words"] = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
                    {
                        { "fun", "enjoy" },
                        { "happy", "joyful" },
                        { "sad", "unhappy" }
                    };
                }
                return (Dictionary<string, string>)Session["Words"];
            }
            set { Session["Words"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // 🔹 Search Function
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string word = txtSearchWord.Text.Trim();
            if (string.IsNullOrEmpty(word))
            {
                lblMessage.Text = "Please enter a word.";
                pnlSearchResult.Visible = false;
                return;
            }

            if (Words.ContainsKey(word))
            {
                lblMessage.Text = "";
                pnlSearchResult.Visible = true;
                lblResultWord.Text = word;
                lblResultTranslation.Text = Words[word];
            }
            else
            {
                pnlSearchResult.Visible = false;
                lblMessage.Text = $"'{word}' not found in dictionary.";
            }
        }

        // 🔹 Add or Update Function
        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string word = txtNewWord.Text.Trim();
            string translation = txtNewTranslation.Text.Trim();

            if (string.IsNullOrEmpty(word) || string.IsNullOrEmpty(translation))
            {
                lblAddMessage.Text = "Please enter both word and translation.";
                return;
            }

            Words[word] = translation; // Add or Update
            lblAddMessage.Text = $"Word '{word}' saved successfully!";
            txtNewWord.Text = "";
            txtNewTranslation.Text = "";
            BindGrid();
        }

        // 🔹 Refresh List
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            gvWords.DataSource = new List<KeyValuePair<string, string>>(Words);
            gvWords.DataBind();
        }
    }
}
