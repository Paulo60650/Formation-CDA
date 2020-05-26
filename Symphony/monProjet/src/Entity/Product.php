<?php
// Entity/Product.php
namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="products")
 */
class Product
{
    /**
     * @ORM\Column(name="ProductId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    public function getId(): ?int
    {
        return $this->id;
    }
    
    /**
     * @ORM\Column(name="ProductName", type="string", length=40)
     */
    private $name;

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }
    
     /**
     * @ORM\Column(name="SupplierID", type="integer")
     */
    private $fourni;

    public function getFourni(): ?int
    {
        return $this->fourni;
    }
    public function setFourni(int $fourni): self
{
    $this->fourni =$fourni;
    return $this;
}

    /**
     * @ORM\Column(name="CategoryID", type="integer")
     */
    private $categorie;

    public function getCategorie(): ?int
    {
        return $this->categorie;
    }
    public function setCategorie(int $categorie): self
    {
        $this->categorie =$categorie;
        return $this;
    }

     /**
     * @ORM\Column(name="QuantityPerUnit", type="string", length=40)
     */
    private $quantityUnit;

    public function getQuantityUnit(): ?string
    {
        return $this->quantityUnit;
    }
    public function setQuantityUnit(string $quantityUnit): self
    {
         $this->quantityUnit = $quantityUnit;
         return $this;
    }

      /**
     * @ORM\Column(name="UnitPrice", type="decimal")
     */
    private $unitPrice;

    public function getUnitPrice(): ?string
    {
        return $this->unitPrice;
    }
    public function setUnitPrice(string $unitPrice): self
    {
         $this->unitPrice = $unitPrice;
         return $this;
    }

     /**
     * @ORM\Column(name="UnitsInStock", type="integer")
     */
    private $stock;

    public function getStock(): ?int
    {
        return $this->stock;
    }
    public function setStock(int $stock): self
    {
         $this->stock= $stock;
         return $this;
    }

    /**
     * @ORM\Column(name="UnitsOnOrder", type="integer")
     */
    private $unitCommand;

    public function getUnitCommand(): ?int
    {
        return $this->unitCommand;
    }
    public function setUnitCommand(int $unitCommand): self
    {
         $this->unitCommand= $unitCommand;
         return $this;
    }

    /**
     * @ORM\Column(name="ReorderLevel", type="integer")
     */
    private $alert;

    public function getAlert(): ?int
    {
        return $this->alert;
    }
    public function setAlert(int $alert): self
    {
         $this->alert= $alert;
         return $this;
    }

     /**
     * @ORM\Column(name="Discontinued", type="integer")
     */
    private $dis;

    public function getDis(): ?int
    {
        return $this->dis;
    }
    public function setDis(int $dis): self
    {
         $this->dis= $dis;
         return $this;
    }

     /**
     * 
     *
     * @ORM\ManyToOne(targetEntity="Suppliers", inversedBy="products")
     * @ORM\JoinColumn(name="SupplierID", referencedColumnName="SupplierID")
     * 
     */
    private $suppliers;

    public function getSuppliers(): ?Suppliers
    {
        return $this->suppliers;
    }

    public function setSuppliers(?Suppliers $suppliers): self
    {
        $this->suppliers = $suppliers;
        return $this;
    }
}