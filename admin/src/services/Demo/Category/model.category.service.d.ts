declare namespace API.Demo {
  export interface CategoryDto {
    name: string;
    description: string;
    tenantId?: string;
    isDeleted: boolean;
    deleterId?: string;
    deletionTime?: string;
    lastModificationTime?: string;
    lastModifierId?: string;
    creationTime: string;
    creatorId?: string;
    id: string;
    extraProperties: any;
  }

  export interface CategoryCreateInputDto {
    name: string;
    description: string;
  }

  export interface CategoryUpdateInputDto {
    name: string;
    description: string;
  }

  export interface CategoryRetrieveInputDto {
    name: string;
    description: string;
    deleted?: number;
    sorting: string;
    skipCount: number;
    maxResultCount: number;
  }
}
