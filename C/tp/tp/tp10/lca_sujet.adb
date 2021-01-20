-- Exemple d'utilisation du module LCA.
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with SDA_Exceptions; 		use SDA_Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
	--! Les Unbounded_String ont une capacité variable, contrairement au String
	--! pour lesquelles une capacité doit être fixée.
with LCA;

procedure LCA_Sujet is
	-- Instanciation générique du type LCA_String_Integer.
	package LCA_String_Integer is
		new LCA (T_Cle => Unbounded_String, T_Donnee => Integer);
	use LCA_String_Integer;

	Mon_LCA : T_LCA; --! Ou plus spécifiquement LCA_String_Integer.T_LCA;

	-- Afficher une Unbounded_String et un entier.
	procedure Afficher (S: in Unbounded_String; N: in Integer) is
	begin
		Put (To_String(S));
		Put (" : ");
		Put (N, 1);
		New_Line;
	end Afficher;

	-- Instanciation générique de la procedure Afficher_Pour_Chaque.
	procedure Afficher_Pour_Chaque is
		new Pour_Chaque (Afficher);

begin
	Initialiser (Mon_LCA);
	Enregistrer (Mon_LCA, To_Unbounded_String("un"), 1);
	--! Mon_LCA = {"un": 1}->Null
	Enregistrer (Mon_LCA, To_Unbounded_String("deux"), 2);
	--! Mon_LCA = {"un": 1}->{"deux": 2}->Null
	--Enregistrer (Mon_LCA, To_Unbounded_String("quatre"), 4);
	--! Mon_LCA = {"un": 1}->{"deux": 2}->{"quatre": 4}->Null
	--Enregistrer (Mon_LCA, To_Unbounded_String("sept"), 7);
	--! Mon_LCA = {"un": 1}->{"deux": 2}->{"quatre": 4}->{"sept": 7}->Null
	--Enregistrer (Mon_LCA, To_Unbounded_String("quatre"), 44);
	--! Mon_LCA = {"un": 1}->{"deux": 2}->{"quatre": 44}->{"sept": 7}->Null
	Afficher_Pour_Chaque (Mon_LCA);
	Vider (Mon_LCA);
	--! Mon_LCA = Null;
end LCA_Sujet;
