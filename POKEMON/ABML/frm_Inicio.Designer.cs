
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frm_Inicio));
            this.dgv_pokemons = new System.Windows.Forms.DataGridView();
            this.pbx_image = new System.Windows.Forms.PictureBox();
            this.btn_add = new System.Windows.Forms.Button();
            this.btn_modify = new System.Windows.Forms.Button();
            this.btn_delete = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox7 = new System.Windows.Forms.GroupBox();
            this.lbl_spDefense = new System.Windows.Forms.Label();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.lbl_defense = new System.Windows.Forms.Label();
            this.groupBox8 = new System.Windows.Forms.GroupBox();
            this.lbl_spAttack = new System.Windows.Forms.Label();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.lbl_attack = new System.Windows.Forms.Label();
            this.groupBox9 = new System.Windows.Forms.GroupBox();
            this.lbl_speed = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.lbl_hp = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.lbl_type2 = new System.Windows.Forms.Label();
            this.lbl_type1 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.lbl_generation = new System.Windows.Forms.Label();
            this.pbx_generation = new System.Windows.Forms.PictureBox();
            this.tbr_images = new System.Windows.Forms.TrackBar();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_pokemons)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbx_image)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox7.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox8.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox9.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbx_generation)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tbr_images)).BeginInit();
            this.SuspendLayout();
            // 
            // dgv_pokemons
            // 
            this.dgv_pokemons.AllowUserToAddRows = false;
            this.dgv_pokemons.AllowUserToDeleteRows = false;
            this.dgv_pokemons.AllowUserToOrderColumns = true;
            this.dgv_pokemons.AllowUserToResizeColumns = false;
            this.dgv_pokemons.AllowUserToResizeRows = false;
            this.dgv_pokemons.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dgv_pokemons.Location = new System.Drawing.Point(15, 96);
            this.dgv_pokemons.MultiSelect = false;
            this.dgv_pokemons.Name = "dgv_pokemons";
            this.dgv_pokemons.ReadOnly = true;
            this.dgv_pokemons.Size = new System.Drawing.Size(302, 192);
            this.dgv_pokemons.TabIndex = 0;
            this.dgv_pokemons.MouseClick += new System.Windows.Forms.MouseEventHandler(this.dgv_pokemons_MouseClick);
            // 
            // pbx_image
            // 
            this.pbx_image.Location = new System.Drawing.Point(327, 96);
            this.pbx_image.Name = "pbx_image";
            this.pbx_image.Size = new System.Drawing.Size(199, 192);
            this.pbx_image.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbx_image.TabIndex = 1;
            this.pbx_image.TabStop = false;
            // 
            // btn_add
            // 
            this.btn_add.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_add.Location = new System.Drawing.Point(15, 45);
            this.btn_add.Name = "btn_add";
            this.btn_add.Size = new System.Drawing.Size(88, 35);
            this.btn_add.TabIndex = 3;
            this.btn_add.Text = "Add";
            this.btn_add.UseVisualStyleBackColor = true;
            this.btn_add.Click += new System.EventHandler(this.btn_agregar_Click);
            // 
            // btn_modify
            // 
            this.btn_modify.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_modify.Location = new System.Drawing.Point(121, 45);
            this.btn_modify.Name = "btn_modify";
            this.btn_modify.Size = new System.Drawing.Size(88, 35);
            this.btn_modify.TabIndex = 4;
            this.btn_modify.Text = "Modify";
            this.btn_modify.UseVisualStyleBackColor = true;
            this.btn_modify.Click += new System.EventHandler(this.btn_modificar_Click);
            // 
            // btn_delete
            // 
            this.btn_delete.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_delete.Location = new System.Drawing.Point(229, 45);
            this.btn_delete.Name = "btn_delete";
            this.btn_delete.Size = new System.Drawing.Size(88, 35);
            this.btn_delete.TabIndex = 5;
            this.btn_delete.Text = "Delete";
            this.btn_delete.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.groupBox7);
            this.groupBox1.Controls.Add(this.groupBox6);
            this.groupBox1.Controls.Add(this.groupBox8);
            this.groupBox1.Controls.Add(this.groupBox5);
            this.groupBox1.Controls.Add(this.groupBox9);
            this.groupBox1.Controls.Add(this.groupBox4);
            this.groupBox1.Location = new System.Drawing.Point(15, 294);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(302, 170);
            this.groupBox1.TabIndex = 14;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Stats";
            // 
            // groupBox7
            // 
            this.groupBox7.Controls.Add(this.lbl_spDefense);
            this.groupBox7.Location = new System.Drawing.Point(211, 97);
            this.groupBox7.Name = "groupBox7";
            this.groupBox7.Size = new System.Drawing.Size(85, 45);
            this.groupBox7.TabIndex = 4;
            this.groupBox7.TabStop = false;
            this.groupBox7.Text = "SpDefense";
            // 
            // lbl_spDefense
            // 
            this.lbl_spDefense.AutoSize = true;
            this.lbl_spDefense.Location = new System.Drawing.Point(25, 16);
            this.lbl_spDefense.Name = "lbl_spDefense";
            this.lbl_spDefense.Size = new System.Drawing.Size(35, 13);
            this.lbl_spDefense.TabIndex = 1;
            this.lbl_spDefense.Text = "label6";
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.lbl_defense);
            this.groupBox6.Location = new System.Drawing.Point(211, 36);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(85, 45);
            this.groupBox6.TabIndex = 1;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Defense";
            // 
            // lbl_defense
            // 
            this.lbl_defense.AutoSize = true;
            this.lbl_defense.Location = new System.Drawing.Point(20, 16);
            this.lbl_defense.Name = "lbl_defense";
            this.lbl_defense.Size = new System.Drawing.Size(35, 13);
            this.lbl_defense.TabIndex = 2;
            this.lbl_defense.Text = "label3";
            // 
            // groupBox8
            // 
            this.groupBox8.Controls.Add(this.lbl_spAttack);
            this.groupBox8.Location = new System.Drawing.Point(106, 97);
            this.groupBox8.Name = "groupBox8";
            this.groupBox8.Size = new System.Drawing.Size(77, 45);
            this.groupBox8.TabIndex = 3;
            this.groupBox8.TabStop = false;
            this.groupBox8.Text = "SpAttack";
            // 
            // lbl_spAttack
            // 
            this.lbl_spAttack.AutoSize = true;
            this.lbl_spAttack.Location = new System.Drawing.Point(21, 16);
            this.lbl_spAttack.Name = "lbl_spAttack";
            this.lbl_spAttack.Size = new System.Drawing.Size(35, 13);
            this.lbl_spAttack.TabIndex = 1;
            this.lbl_spAttack.Text = "label5";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.lbl_attack);
            this.groupBox5.Location = new System.Drawing.Point(106, 36);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(77, 45);
            this.groupBox5.TabIndex = 1;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Attack";
            // 
            // lbl_attack
            // 
            this.lbl_attack.AutoSize = true;
            this.lbl_attack.Location = new System.Drawing.Point(15, 16);
            this.lbl_attack.Name = "lbl_attack";
            this.lbl_attack.Size = new System.Drawing.Size(35, 13);
            this.lbl_attack.TabIndex = 1;
            this.lbl_attack.Text = "label2";
            // 
            // groupBox9
            // 
            this.groupBox9.Controls.Add(this.lbl_speed);
            this.groupBox9.Location = new System.Drawing.Point(6, 97);
            this.groupBox9.Name = "groupBox9";
            this.groupBox9.Size = new System.Drawing.Size(73, 45);
            this.groupBox9.TabIndex = 2;
            this.groupBox9.TabStop = false;
            this.groupBox9.Text = "Speed";
            // 
            // lbl_speed
            // 
            this.lbl_speed.AutoSize = true;
            this.lbl_speed.Location = new System.Drawing.Point(15, 16);
            this.lbl_speed.Name = "lbl_speed";
            this.lbl_speed.Size = new System.Drawing.Size(35, 13);
            this.lbl_speed.TabIndex = 1;
            this.lbl_speed.Text = "label4";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.lbl_hp);
            this.groupBox4.Location = new System.Drawing.Point(6, 36);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(73, 45);
            this.groupBox4.TabIndex = 0;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "HP";
            // 
            // lbl_hp
            // 
            this.lbl_hp.AutoSize = true;
            this.lbl_hp.Location = new System.Drawing.Point(15, 16);
            this.lbl_hp.Name = "lbl_hp";
            this.lbl_hp.Size = new System.Drawing.Size(35, 13);
            this.lbl_hp.TabIndex = 0;
            this.lbl_hp.Text = "label1";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.lbl_type2);
            this.groupBox2.Controls.Add(this.lbl_type1);
            this.groupBox2.Location = new System.Drawing.Point(327, 295);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(200, 89);
            this.groupBox2.TabIndex = 15;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Types";
            // 
            // lbl_type2
            // 
            this.lbl_type2.AutoSize = true;
            this.lbl_type2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lbl_type2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_type2.Location = new System.Drawing.Point(130, 51);
            this.lbl_type2.Name = "lbl_type2";
            this.lbl_type2.Size = new System.Drawing.Size(43, 15);
            this.lbl_type2.TabIndex = 1;
            this.lbl_type2.Text = "label2";
            // 
            // lbl_type1
            // 
            this.lbl_type1.AutoSize = true;
            this.lbl_type1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lbl_type1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_type1.Location = new System.Drawing.Point(31, 51);
            this.lbl_type1.Name = "lbl_type1";
            this.lbl_type1.Size = new System.Drawing.Size(43, 15);
            this.lbl_type1.TabIndex = 0;
            this.lbl_type1.Text = "label1";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.lbl_generation);
            this.groupBox3.Controls.Add(this.pbx_generation);
            this.groupBox3.Location = new System.Drawing.Point(327, 391);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(200, 73);
            this.groupBox3.TabIndex = 16;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Generation";
            // 
            // lbl_generation
            // 
            this.lbl_generation.AutoSize = true;
            this.lbl_generation.Location = new System.Drawing.Point(6, 40);
            this.lbl_generation.Name = "lbl_generation";
            this.lbl_generation.Size = new System.Drawing.Size(60, 13);
            this.lbl_generation.TabIndex = 1;
            this.lbl_generation.Text = "generacion";
            // 
            // pbx_generation
            // 
            this.pbx_generation.Location = new System.Drawing.Point(94, 19);
            this.pbx_generation.Name = "pbx_generation";
            this.pbx_generation.Size = new System.Drawing.Size(100, 48);
            this.pbx_generation.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbx_generation.TabIndex = 0;
            this.pbx_generation.TabStop = false;
            // 
            // tbr_images
            // 
            this.tbr_images.Location = new System.Drawing.Point(427, 45);
            this.tbr_images.Maximum = 2;
            this.tbr_images.Name = "tbr_images";
            this.tbr_images.Size = new System.Drawing.Size(100, 45);
            this.tbr_images.TabIndex = 17;
            this.tbr_images.Scroll += new System.EventHandler(this.tbr_images_Scroll);
            // 
            // frm_Inicio
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(545, 471);
            this.Controls.Add(this.tbr_images);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btn_delete);
            this.Controls.Add(this.btn_modify);
            this.Controls.Add(this.btn_add);
            this.Controls.Add(this.pbx_image);
            this.Controls.Add(this.dgv_pokemons);
            this.ForeColor = System.Drawing.SystemColors.ControlText;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frm_Inicio";
            this.Text = "POKéDEX";
            ((System.ComponentModel.ISupportInitialize)(this.dgv_pokemons)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbx_image)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox7.ResumeLayout(false);
            this.groupBox7.PerformLayout();
            this.groupBox6.ResumeLayout(false);
            this.groupBox6.PerformLayout();
            this.groupBox8.ResumeLayout(false);
            this.groupBox8.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.groupBox9.ResumeLayout(false);
            this.groupBox9.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbx_generation)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tbr_images)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgv_pokemons;
        private System.Windows.Forms.PictureBox pbx_image;
        private System.Windows.Forms.Button btn_add;
        private System.Windows.Forms.Button btn_modify;
        private System.Windows.Forms.Button btn_delete;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label lbl_generation;
        private System.Windows.Forms.PictureBox pbx_generation;
        private System.Windows.Forms.Label lbl_type2;
        private System.Windows.Forms.Label lbl_type1;
        private System.Windows.Forms.GroupBox groupBox7;
        private System.Windows.Forms.Label lbl_spDefense;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.Label lbl_defense;
        private System.Windows.Forms.GroupBox groupBox8;
        private System.Windows.Forms.Label lbl_spAttack;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Label lbl_attack;
        private System.Windows.Forms.GroupBox groupBox9;
        private System.Windows.Forms.Label lbl_speed;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Label lbl_hp;
        private System.Windows.Forms.TrackBar tbr_images;
    }
}

