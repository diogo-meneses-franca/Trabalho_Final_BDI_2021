package Capitulo3;

public class Account {
    private String name; //variável de instância
    //método para definir o nome do objeto
    public void setName(String name)
    {
        this.name = name;// armazena o nome
    }
    public String getName()
    {
        return name; //retorna valor do nome para o chamador
    }
}
