<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class SupplierController extends AbstractController
{
    /**
     * @Route("/supplier", name="supplier")
     */
    public function index()
    {
        return $this->render('supplier/index.html.twig', [
            'controller_name' => 'SupplierController',
        ]);
    }
}
