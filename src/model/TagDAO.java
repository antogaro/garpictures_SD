package model;

import java.sql.*;
import java.util.ArrayList;

public class TagDAO {

    public ArrayList<Tag> doRetriveAll(){
        ArrayList<Tag> tags = new ArrayList<>();
        Statement statement;
        ResultSet rs;
        Prodotto p;
        try(Connection connection = ConnessioneDB.getConnection()){
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM tag");
            while(rs.next()){
                Tag tag = new Tag();
                tag.setTag(rs.getString(1));
                tags.add(tag);
            }
            return tags;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Tag doRetriveByID(String nomeTag){
        try(Connection connection = ConnessioneDB.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT Nome_tag FROM tag WHERE nome_tag=?");
            preparedStatement.setString(1,nomeTag);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                Tag tag = new Tag();
                tag.setTag(rs.getString(1));
                return tag;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Tag> doRetriveByProdotto(Prodotto prodotto){
        try(Connection connection = ConnessioneDB.getConnection()){
            ArrayList<Tag> tags = new ArrayList<>();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT nome_tag FROM Garpictures.tag_prodotto,Garpictures.prodotto WHERE tag_prodotto.id_prodotto = prodotto.id AND tag_prodotto.id_prodotto=?");
            preparedStatement.setInt(1,prodotto.getId());
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                Tag tag = new Tag();
                tag.setTag(rs.getString(1));
                tags.add(tag);
            }
            return tags;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(Tag tag) {
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO tag(nome_tag) VALUES(?)"
            );
            ps.setString(1,tag.getTag());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doRelation(Tag tag,Prodotto prodotto) {
        try (Connection con = ConnessioneDB.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO tag_prodotto(Nome_tag,Id_prodotto) VALUES(?,?)"
            );
            ps.setString(1,tag.getTag());
            ps.setInt(2,prodotto.getId());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
