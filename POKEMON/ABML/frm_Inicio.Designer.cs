
namespace ABML
{
    partial class frm_Inicio
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgv_pokemons = new System.Windows.Forms.DataGridView();
            this.pbx_image = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_pokemons)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbx_image)).BeginInit();
            this.SuspendLayout();
            // 
            // dgv_pokemons
            // 
            this.dgv_pokemons.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_pokemons.Location = new System.Drawing.Point(12, 361);
            this.dgv_pokemons.Name = "dgv_pokemons";
            this.dgv_pokemons.Size = new System.Drawing.Size(1205, 192);
            this.dgv_pokemons.TabIndex = 0;
            this.dgv_pokemons.MouseClick += new System.Windows.Forms.MouseEventHandler(this.dgv_pokemons_MouseClick);
            // 
            // pbx_image
            // 
            this.pbx_image.Location = new System.Drawing.Point(967, 12);
            this.pbx_image.Name = "pbx_image";
            this.pbx_image.Size = new System.Drawing.Size(250, 250);
            this.pbx_image.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbx_image.TabIndex = 1;
            this.pbx_image.TabStop = false;
            // 
            // frm_Inicio
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1229, 582);
            this.Controls.Add(this.pbx_image);
            this.Controls.Add(this.dgv_pokemons);
            this.Name = "frm_Inicio";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.dgv_pokemons)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbx_image)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgv_pokemons;
        private System.Windows.Forms.PictureBox pbx_image;
    }
}

