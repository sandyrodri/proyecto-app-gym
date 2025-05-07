package proyectofinal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


public class MySQL {
    
    
    private static Connection Conexion;
    private String user = "";
    ArrayList valores = new ArrayList();
   

    
    public void conexion (String user , String password ) throws SQLException{
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectofinal", user, password);
           // JOptionPane.showMessageDialog(null, "Conectado a la base de datos");
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MySQL.class.getName()).log(Level.SEVERE, null, ex);
        }

        
    }
    
    
    public void desconexion (){
        
        try {
            Conexion.close();
            //JOptionPane.showMessageDialog(null, "Desconectado de la base de datos");
            
        } catch (SQLException ex) {
            Logger.getLogger(MySQL.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        
    }
    
    // dar de alta un cliente con todos los datos recogidos en formulario
    public void insertar(String nombre , String apellido , String apellido2 , String dni , String sexo , String fecha , String direccion, String telefono ,String fechaIngreso , String importe , String estado,String usuario,String password, int id_nivel) throws SQLException {
        String query = "INSERT INTO login (USUARIO,PASSWORD, ID_NIVEL)VALUES('"+usuario+"','"+password+"',"+id_nivel+")";
        String query2 = "INSERT INTO clientes (NOMBRE,APELLIDO,SUBAPELLIDO,DNI,SEXO,FECHA_NACIMIENTO,DIRECCION,CONTACTO,FECHA_INGRESO,IMPORTE,ESTADO, USUARIO) VALUES( '" + nombre + "','" + apellido + "','" + apellido2 + "','" + dni + "','" + sexo + "','" + fecha + "','" + direccion + "','" + telefono + "','"+fechaIngreso+ "'," + importe + ",'"+estado+"','"+usuario+"')";
        //tambien inserta en la tabla de usuario y password
        Statement st =Conexion.createStatement();
        st.executeUpdate(query);
        st.executeUpdate(query2);
        JOptionPane.showMessageDialog(null, "Almacenado en la base de datos");
    }
    
    
    //muestra valores para tabla
      public ArrayList getValues(){
        valores = new ArrayList();        
        try {
            String query = "SELECT c.usuario as usuario, c.nombre as nombre, c.apellido as apellido, "
                    + "c.subapellido as subapellido, c.dni as dni, c.estado as estado, n.nivel as nivel FROM clientes c "
                    + "INNER JOIN login l ON (c.usuario = l.usuario)"
                    + "INNER JOIN nivel n ON (l.id_nivel = n.id_nivel) "; 
            
            Statement st = Conexion.createStatement();
            java.sql.ResultSet resulset;
            resulset = st.executeQuery(query);
            System.out.println("consultando a la base de datos...");
            
            while(resulset.next()){    
                String usuario = resulset.getString("USUARIO");
                String nombre = resulset.getString("NOMBRE");
                String apell = resulset.getString("APELLIDO");
                String subapell = resulset.getString("SUBAPELLIDO");
                String dni = resulset.getString("DNI");
                String estado  = resulset.getString("ESTADO");
                String nivel  = resulset.getString("NIVEL");

                valores.add(new Object[]{usuario,nombre,apell,subapell,dni, estado, nivel});
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MySQL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valores;
        
        
        
    }
      
    // elimina datos
      
    public void borrarDatos(int id){
         
        try {
            String query = "DELETE FROM clientes WHERE ID_CLIENTE = " +id;
            
            Statement st = Conexion.createStatement();
            st.executeUpdate(query);
            System.out.println("eliminado ok");
  
        } catch (SQLException ex) {
            System.out.println("no se ha podido borrar bien los datos del cliente : " + ex.getMessage() );
        }
             
    }
    
    //modificar el cliente
    public void modificar(String nombre , String apellido , String subapellido , String dni , String estado, String usuario, int id_nivel){
        
        try {
            String query = "UPDATE clientes SET NOMBRE = '" +nombre+ "',APELLIDO ='" +apellido+ "',SUBAPELLIDO = '" +subapellido+ "', DNI = '" +dni+ "',ESTADO = '" +estado+ "' WHERE USUARIO = '" +usuario+ "'";
            
            Statement st = Conexion.createStatement();
            st.executeUpdate(query);
            String query2 = "UPDATE login SET id_nivel = "+id_nivel+" WHERE usuario ='"+usuario+"'";
            Statement st2 = Conexion.createStatement();
            st2.executeUpdate(query2);
            
            JOptionPane.showMessageDialog(null, "Datos modificados correctamente");
            
        } catch (SQLException ex) {
            Logger.getLogger(MySQL.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    // comprobara si el administrados esta dado de alta en la base de datos
    
    public boolean compruebaBDadmin(String usuario, String password) throws Exception {
        String query = "SELECT COUNT(USUARIO) as total FROM login WHERE USUARIO='"+usuario+"' AND PASSWORD='"+password+"' AND ID_NIVEL IS NULL ";

        Statement st = Conexion.createStatement();
        ResultSet rs = st.executeQuery(query);
        if(rs.next()) {
            if(rs.getInt("total") == 1) {
                return true;
            }
        }
        return false;       
    }
    
    // busqueda en bd de filtros
    
    public ArrayList filtros(String nombre ,String apellido ,String apellido2,String dni,String estado, String nivel, String usuario){
        valores = new ArrayList();        
        try {
            String query = "SELECT c.usuario as usuario, c.nombre as nombre, c.apellido as apellido, "
                    + "c.subapellido as subapellido, c.dni as dni, c.estado as estado, n.nivel as nivel FROM clientes c "
                    + "INNER JOIN login l ON (c.usuario = l.usuario) "
                    + "INNER JOIN nivel n ON (l.id_nivel = n.id_nivel) "; 
            String finquery = "";
            if(!nombre.trim().equals("") || !apellido.trim().equals("") || !apellido2.trim().equals("") ||
               !dni.trim().equals("") || !estado.equals("TODOS") || !nivel.equals("TODOS") || !usuario.trim().equals("")) {
                query += " WHERE ";
                finquery = " c.id_cliente > 0";
            }
            if(!usuario.trim().equals("")) {
                query += " c.usuario LIKE '%"+usuario+"%' AND ";
            }
            if(!nombre.trim().equals("")) {
                query += " c.nombre LIKE '%"+nombre+"%' AND ";
            }
            if(!apellido.trim().equals("")) {
                query += " c.apellido LIKE '%"+apellido+"%' AND ";
            }
            if(!apellido2.trim().equals("")) {
                query += " c.subapellido LIKE '%"+apellido2+"%' AND ";
            }            
            if(!dni.trim().equals("")) {
                query += " c.dni LIKE '%"+dni+"%' AND ";
            }             
            if(!estado.equals("TODOS")) {
                query += " c.estado = '"+estado+"' AND ";
            }       
            if(!nivel.equals("TODOS")) {
                int id_nivel = 1;
                if(nivel.toUpperCase().equals("INTERMEDIO")) {
                    id_nivel = 2;
                } else if(nivel.toUpperCase().equals("AVANZADO")) {
                    id_nivel = 3;
                } 
                query += " l.id_nivel = "+id_nivel+" AND ";
            }
            if(!finquery.equals("")) {
                query += finquery;
            }
            //WHERE nombre='"+nombre+"' || apellido='"+apellido+"' || subapellido='"+apellido2+"' || dni='"+dni+"' || estado= '"+estado+"'";
            
            
            Statement st = Conexion.createStatement();
            java.sql.ResultSet resulset;
            resulset = st.executeQuery(query);
            System.out.println("comprobando filtros...");
            
             while(resulset.next()){    
                usuario = resulset.getString("USUARIO");
                nombre = resulset.getString("NOMBRE");
                apellido = resulset.getString("APELLIDO");
                apellido2 = resulset.getString("SUBAPELLIDO");
                dni = resulset.getString("DNI");
                estado  = resulset.getString("ESTADO");
                nivel = resulset.getString("NIVEL");

                valores.add(new Object[]{usuario,nombre,apellido,apellido2,dni,estado, nivel});
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MySQL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valores;
            
        
        
        
    }
    
    
    
    
    
    
 }
