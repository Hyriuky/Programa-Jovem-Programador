import os
from servico import NovoServico, ListarServicos, DetalheServico, AlterarServico, DeletaServico

def Limpa_Tela():
    # Limpa a tela do terminal
    os.system("cls" if os.name == "nt" else "clear")

def MenuServico():
    while True:
        # Limpando a tela
        Limpa_Tela()
        # Criando o menu principal
        print("============== Menu Serviço ==============")
        print("1. Cadastrar Serviço")
        print("2. Listar Serviços")
        print("3. Ver detalhe do Serviço")
        print("4. Alterar Serviço")
        print("5. Deletar Serviço")
        print("6. Sair")
        print("===========================================")
        escolha = input("Escolha uma opção (1-6): ")

        if escolha == "1":
            # chamando metodo para cadastrar serviço
            NovoServico()
        elif escolha == "2":
            # chamando metodo para listar todos os serviços
            ListarServicos()
            input("Pressione Enter para continuar...")
        elif escolha == "3":
            # chamando metodo que lista todos os serviços para que o usuário possa escolher um
            ListarServicos()
            id = input("Digite o ID do serviço para ver os detalhes: ")
            Limpa_Tela()
            # chamando metodo para ver detalhes do serviço
            DetalheServico(id)
        elif escolha == "4":
            # chamando o metodo para listar todos os serviços para escolher um serviço
            ListarServicos()
            id = input("Digite o ID do serviço que deseja alterar: ")
            Limpa_Tela()
            # chamando o metodo para alterar o serviço
            AlterarServico(id)
        elif escolha == "5":
            # chamando metodo para deletar serviço
            ListarServicos()
            id = input("Digite o ID do serviço que deseja deletar: ")
            Limpa_Tela()
            DeletaServico(id)
        elif escolha == "6":
            print("Voltando ao menu principal...")
            break