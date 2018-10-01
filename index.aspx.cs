using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;

namespace JobDescriptionApp
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DirectoryInfo c = new DirectoryInfo(@"\\stpfs2msc\global\Human Resource Info\Job Descriptions\Classified Job Descriptions & Listing\Internet PDF");//Assuming Test is your Folder
            DirectoryInfo m = new DirectoryInfo(@"\\stpfs2msc\global\Human Resource Info\Job Descriptions\Management Job Descriptions & Listing\Mgmt PDF Intranet Udrive\");
            FileInfo[] Files = c.GetFiles("*.pdf"); //Getting pdf files
            FileInfo[] Files2 = m.GetFiles("*.pdf");
            Debug.WriteLine(c.Exists);
            Debug.WriteLine(m.Exists);
            string href = "";
            foreach (FileInfo file in Files)
            {
                href = "http://stpintmsc/STP_FILE_SERVER/Human Resource Info/Job Descriptions/Classified Job Descriptions & Listing/Internet PDF/" + file.Name;
                ClassifiedDescriptions.InnerHtml += "<ul style='list-style: none;'><li class='classified' data-pdfValue='0'><a href='" + href + "' target='_blank'>" + Path.GetFileNameWithoutExtension(file.Name) + "</a></li></ul>";
            }
            foreach (FileInfo file in Files2)
            {
                href = "http://stpintmsc/STP_FILE_SERVER/Human Resource Info/Job Descriptions/Management Job Descriptions & Listing/Mgmt PDF Intranet Udrive/" + file.Name;
                ManagementDescriptions.InnerHtml += "<ul style='list-style: none;'><li class='management' data-pdfValue='0'><a href='" + href + "' target='_blank'>" + Path.GetFileNameWithoutExtension(file.Name) + "</a></li></ul>";
            }
            
        }
    }
}