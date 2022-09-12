import { request } from 'umi';
export const Create = async (input: API.Demo.CategoryCreateInputDto): Promise<API.Demo.CategoryDto> => {
if (!input.extraProperties) { input.extraProperties = {}; }
  return await request<API.Demo.CategoryDto>(`${Demo_API}api/v1/Category`, {
    method: 'Post',
data: input
  });
};
export const DeleteById = async (id: string): Promise<void> => {
  return await request<void>(`${Demo_API}api/v1/Category/${id}`, {
    method: 'Delete',
  });
};
export const DeleteByKeys = async (keys: string[]): Promise<void> => {
  return await request<void>(`${Demo_API}api/v1/Category/keys`, {
    method: 'Delete',
data: keys
  });
};
export const Update = async (id: string,input: API.Demo.CategoryUpdateInputDto): Promise<API.Demo.CategoryDto> => {
  return await request<API.Demo.CategoryDto>(`${Demo_API}api/v1/Category/${id}`, {
    method: 'Put',
data: input
  });
};
export const UpdatePortion = async (id: string,inputDto: API.Demo.CategoryUpdateInputDto): Promise<void> => {
  return await request<void>(`${Demo_API}api/v1/Category/Patch/${id}`, {
    method: 'Put',
data: inputDto
  });
};
export const Recover = async (id: string): Promise<void> => {
  return await request<void>(`${Demo_API}api/v1/Category/${id}/Recover`, {
    method: 'Put',
  });
};
export const GetList = async (input: API.Demo.CategoryRetrieveInputDto): Promise<API.PagedResultDto<API.Demo.CategoryDto>> => {
  return await request<API.PagedResultDto<API.Demo.CategoryDto>>(`${Demo_API}api/v1/Category`, {
    method: 'Get',
params: input
  });
};
export const GetEntitys = async (inputDto: API.Demo.CategoryRetrieveInputDto): Promise<API.ListResultDto<API.Demo.CategoryDto>> => {
  return await request<API.ListResultDto<API.Demo.CategoryDto>>(`${Demo_API}api/v1/Category/all`, {
    method: 'Get',
params: inputDto
  });
};
export const Get = async (id: string): Promise<API.Demo.CategoryDto> => {
  return await request<API.Demo.CategoryDto>(`${Demo_API}api/v1/Category/${id}`, {
    method: 'Get',
  });
};
