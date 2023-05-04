package model;

import java.sql.*;
import java.util.ArrayList;

public class UtenteDAO {

    public Utente doRetriveById(int id){
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id,nome,cognome,nome_utente,password,indirizzo,provincia," +
                    "telefono,città,amministratore,email FROM utente WHERE id=?");
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                Utente utente = new Utente();
                utente.setId(rs.getInt(1));
                utente.setNome(rs.getString(2));
                utente.setCognome(rs.getString(3));
                utente.setNomeUtente(rs.getString(4));
                utente.setPassword(rs.getString(5));
                utente.setIndirizzo(rs.getString(6));
                utente.setProvincia(rs.getString(7));
                utente.setTelefono(rs.getString(8));
                utente.setCitta(rs.getString(9));
                utente.setAmministratore(rs.getBoolean(10));
                utente.setEmail(rs.getString(11));
                return utente;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Utente> doRetriveAll(){
        ArrayList<Utente> utenti = new ArrayList<>();
        Statement statement;
        ResultSet rs;
        Prodotto p;
        try(Connection connection = ConnessioneDB.getConnection()){
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM utente");
            while(rs.next()){
                Utente utente = new Utente();
                utente.setId(rs.getInt(1));
                utente.setNome(rs.getString(2));
                utente.setCognome(rs.getString(3));
                utente.setNomeUtente(rs.getString(4));
                utente.setPassword(rs.getString(5));
                utente.setIndirizzo(rs.getString(6));
                utente.setProvincia(rs.getString(7));
                utente.setTelefono(rs.getString(8));
                utente.setCitta(rs.getString(9));
                utente.setAmministratore(rs.getBoolean(10));
                utente.setEmail(rs.getString(11));
                utenti.add(utente);
            }
            return utenti;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(Utente utente) {
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO utente (nome,cognome,nome_utente,password,indirizzo,provincia,telefono,città,amministratore,email) VALUES(?,?,?,?,?,?,?,?,?,?)"
            );
            ps.setString(1,utente.getNome());
            ps.setString(2,utente.getCognome());
            ps.setString(3,utente.getNomeUtente());
            ps.setString(4,utente.getPassword());
            ps.setString(5,utente.getIndirizzo());
            ps.setString(6,utente.getProvincia());
            ps.setString(7,utente.getTelefono());
            ps.setString(8,utente.getCitta());
            ps.setBoolean(9,utente.isAmministratore());
            ps.setString(10,utente.getEmail());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("insert error");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int retriveIdByUsername(String nomeUtente){
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT Id FROM utente WHERE Nome_Utente=?");
            preparedStatement.setString(1,nomeUtente);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
            return -1;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doDeleteByID(int id){
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM utente WHERE id=?");
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doUpdate(Utente utente) {
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE utente SET nome=?,cognome=?,nome_utente=?,password=?,indirizzo=?,provincia=?,telefono=?,città=?,amministratore=?,email=? WHERE utente.id =?"
            );
            ps.setString(1,utente.getNome());
            ps.setString(2,utente.getCognome());
            ps.setString(3,utente.getNomeUtente());
            ps.setString(4,utente.getPassword());
            ps.setString(5,utente.getIndirizzo());
            ps.setString(6,utente.getProvincia());
            ps.setString(7,utente.getTelefono());
            ps.setString(8,utente.getCitta());
            ps.setBoolean(9,utente.isAmministratore());
            ps.setString(10,utente.getEmail());
            ps.setInt(11,utente.getId());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
