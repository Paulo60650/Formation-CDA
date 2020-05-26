<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200524234724 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE customers ADD customers_list_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE customers ADD CONSTRAINT FK_62534E211E6C56E FOREIGN KEY (customers_list_id) REFERENCES orders (id)');
        $this->addSql('CREATE INDEX IDX_62534E211E6C56E ON customers (customers_list_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE customers DROP FOREIGN KEY FK_62534E211E6C56E');
        $this->addSql('DROP INDEX IDX_62534E211E6C56E ON customers');
        $this->addSql('ALTER TABLE customers DROP customers_list_id');
    }
}
