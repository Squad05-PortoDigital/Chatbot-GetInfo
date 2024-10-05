package org.squad05.chatbot.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.squad05.chatbot.DTOs.ChatbotProcessoDTO;
import org.squad05.chatbot.models.ChatbotProcesso;
import org.squad05.chatbot.models.Funcionario;
import org.squad05.chatbot.repositories.ChatbotRepository;
import org.squad05.chatbot.service.exceptions.DataBaseException;
import org.squad05.chatbot.service.exceptions.ResourceNotFoundException;

@Service
public class ChatbotService {

    @Autowired
    private ChatbotRepository chatbotRepository;

    @Autowired
    private FuncionarioService funcionarioService;

    @Value("${file.upload-dir}")
    private String uploadDir;

    @Value("${email.host}")
    private String host;

    @Value("${email.user}")
    private String user;

    @Value("${email.password}")
    private String password;

    @Value("${email.port}")
    private String port;

    public void init() {
        try {
            Files.createDirectories(Paths.get(uploadDir));
        } catch (IOException e) {
            throw new RuntimeException("Não foi possível criar o diretório de arquivos.");
        }
    }

    //Criar um processo
    public ChatbotProcesso criarProcesso(ChatbotProcessoDTO chatbotProcessoDTO) {
        Funcionario funcionario = funcionarioService.buscarFuncionarioPorId(chatbotProcessoDTO.getId_funcionario());

        ChatbotProcesso chatbotProcesso = new ChatbotProcesso();
        chatbotProcesso.setId_funcionario(funcionario);
        chatbotProcesso.setTipo_processo(chatbotProcessoDTO.getTipo_processo());
        chatbotProcesso.setData_solicitacao(chatbotProcessoDTO.getData_solicitacao());
        chatbotProcesso.setStatus(chatbotProcessoDTO.getStatus());
        chatbotProcesso.setDescricao(chatbotProcessoDTO.getDescricao());
        chatbotProcesso.setUrgencia(chatbotProcessoDTO.getUrgencia());
        chatbotProcesso.setId_destinatario(chatbotProcessoDTO.getId_destinatario());

        return chatbotRepository.save(chatbotProcesso);
    }

    //Buscar processo por ID
    public ChatbotProcesso buscarProcessoPorId(Long id) {
        return chatbotRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(id));
    }

    //Atualizar um processo
    public ChatbotProcesso atualizarProcesso(Long id, ChatbotProcessoDTO dadosAtualziados) {
        try {
            if (!chatbotRepository.existsById(id)) throw new ResourceNotFoundException(id);
            ChatbotProcesso processo = buscarProcessoPorId(id);
            processo.setTipo_processo(dadosAtualziados.getTipo_processo());
            processo.setData_solicitacao(dadosAtualziados.getData_solicitacao());
            processo.setStatus(dadosAtualziados.getStatus());
            processo.setDescricao(dadosAtualziados.getDescricao());
            processo.setUrgencia(dadosAtualziados.getUrgencia());
            processo.setId_destinatario(dadosAtualziados.getId_destinatario());

            return chatbotRepository.save(processo);
        } catch (ResourceNotFoundException e) {
            throw new ResourceNotFoundException(id);
        }
    }

    //Deletar um processo
    public void deletarProcesso(Long id) {
    	try {
    		if (!chatbotRepository.existsById(id)) throw new ResourceNotFoundException(id);
    		ChatbotProcesso processo = buscarProcessoPorId(id);
    		chatbotRepository.delete(processo);   		
    	} catch (ResourceNotFoundException e) {
    		throw new ResourceNotFoundException(id);
    	} catch (DataIntegrityViolationException e) {
	    	throw new DataBaseException(e.getMessage());
	    } 
    }

    //Listar todos os processos
    public List<ChatbotProcesso> listarTodosProcessos() {
        return chatbotRepository.findAll();
    }

    //Upload de arquvios
    public String enviarArquivo(MultipartFile file, Long processoId) throws Exception {

        //Cria o diretório se não existir
        Files.createDirectories(Paths.get(uploadDir));
        //Salvando o arquivo no sistema
        Path filePath = Paths.get(uploadDir, file.getOriginalFilename());
        Files.write(filePath, file.getBytes());

        ChatbotProcesso processo = buscarProcessoPorId(processoId);
        processo.setCaminho_arquivo(filePath.toString());
        chatbotRepository.save(processo);

        return "Arquivo enviado com sucesso: " + filePath.toString();
    }

    //Envio de e-mail
    public void enviarEmail(String to, String subject, String body) throws Exception {

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.starttls.enable", "true");

        // Criação da sessão de e-mail
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            // Criação da mensagem de e-mail
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);

            // Envio da mensagem
            Transport.send(message);

            System.out.println("E-mail enviado com sucesso!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
